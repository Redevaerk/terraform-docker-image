locals {
  tags       = var.add_latest_tag && !contains(var.tags, "latest") ? compact(concat(["latest"], var.tags)) : compact(var.tags)
  image_name = "${var.registry}/${var.name}"
  context    = coalesce(var.context, path.cwd)
  build_triggers_source = var.dynamic_build && var.dynamic_build_attach_source ? {
    source_dir = sha1(join("", [for f in fileset(local.context, "${var.dynamic_build_source_dir}/*") : filesha1("${local.context}/${f}")]))
  } : {}
  build_triggers_dockerfile = var.dynamic_build && var.dynamic_build_attach_dockerfile ? {
    dockerfile = filesha1("${local.context}/${var.dockerfile}")
  } : {}
  build_triggers_dockerignorefile = var.dynamic_build && var.dynamic_build_attach_dockerignore ? {
    dockerignorefile = filesha1("${local.context}/.dockerignore")
  } : {}
  build_triggers_extra = var.dynamic_build && var.dynamic_build_extra != null ? var.dynamic_build_extra : null
  build_triggers = var.dynamic_build ? merge(
    local.build_triggers_source,
    local.build_triggers_dockerfile,
    local.build_triggers_dockerignorefile,
    local.build_triggers_extra
  ) : null
}

resource "docker_registry_image" "this" {
  for_each      = var.push ? toset(docker_image.this.build[*].tag[0]) : toset([])
  name          = each.value
  keep_remotely = var.keep_remotely
  triggers      = local.build_triggers
}

resource "docker_image" "this" {
  name         = "${local.image_name}:${local.tags[0]}"
  force_remove = var.force_remove
  keep_locally = var.keep_locally
  build {
    context    = local.context
    dockerfile = var.dockerfile
    tag        = [for tag in local.tags : "${local.image_name}:${tag}"]
    labels     = var.labels
  }
  triggers = local.build_triggers
}
