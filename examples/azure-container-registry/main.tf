provider "docker" {
  host = "unix:///var/run/docker.sock"
  registry_auth {
    address  = azurerm_container_registry.acr.login_server
    username = azurerm_container_registry.acr.admin_username
    password = azurerm_container_registry.acr.admin_password
  }
}

provider "azurerm" {
  features {}
}

resource "random_password" "this" {
  length  = 16
  special = false
}

resource "azurerm_container_registry" "acr" {
  name                = "${var.name}Registry${random_password.this.result}"
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = "Basic"
  admin_enabled       = true
}

module "docker_image" {
  source   = "../../"
  name     = var.name
  registry = azurerm_container_registry.acr.login_server
}
