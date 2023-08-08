output "images" {
  description = "List of all created docker images"
  value       = module.docker_image.images
}

output "map_images" {
  description = "Map per tag corresponding docker images"
  value       = module.docker_image.map_images
}
