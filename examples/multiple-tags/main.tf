provider "docker" {
  host = "unix:///var/run/docker.sock"
  registry_auth {
    address     = "registry-1.docker.io"
    config_file = pathexpand("~/.docker/config.json")
  }
}

module "docker_image" {
  source        = "../../"
  name          = var.name
  tags          = ["v1", "beta"]
  keep_remotely = false
}
