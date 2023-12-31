output "images" {
  description = "List of all created docker images"
  value       = docker_image.this.build[*].tag[0]
}

output "map_images" {
  description = "Map per tag corresponding docker images"
  value       = { for tag in local.tags : tag => "${local.image_name}:${tag}" }
}
