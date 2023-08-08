locals {
  image_name = "${var.registry}/${var.name}:${var.tag}"
  context    = coalesce(var.context, path.cwd)
  build_triggers_source = var.create && var.dynamic_build && var.dynamic_build_attach_source ? {
    source_dir = sha1(join("", [for f in fileset(local.context, "${var.dynamic_build_source_dir}/*") : filesha1("${local.context}/${f}")]))
  } : {}
  build_triggers_dockerfile = var.create && var.dynamic_build && var.dynamic_build_attach_dockerfile ? {
    dockerfile = filesha1("${local.context}/${var.dockerfile}")
  } : {}
  build_triggers_dockerignorefile = var.create && var.dynamic_build && var.dynamic_build_attach_dockerignore ? {
    dockerignorefile = filesha1("${local.context}/.dockerignore")
  } : {}
  build_triggers_extra = var.create && var.dynamic_build && var.dynamic_build_extra != null ? var.dynamic_build_extra : null
  build_triggers = var.create && var.dynamic_build ? merge(
    local.build_triggers_source,
    local.build_triggers_dockerfile,
    local.build_triggers_dockerignorefile,
    local.build_triggers_extra
  ) : null
}

resource "docker_registry_image" "this" {
  count         = var.create && var.push ? 1 : 0
  name          = docker_image.this[0].name
  keep_remotely = true
  triggers      = local.build_triggers
}

resource "docker_image" "this" {
  count        = var.create ? 1 : 0
  name         = local.image_name
  force_remove = var.force_remove
  keep_locally = var.keep_locally
  build {
    context    = local.context
    dockerfile = var.dockerfile
    tag        = [local.image_name]
    labels     = var.labels
  }
  triggers = local.build_triggers
}
