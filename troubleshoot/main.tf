terraform {
    required_providers{
        docker = {
            source = "kreuzwerker/docker"
            version = "3.0.1"
        }
    }
}

provider "docker" {}
  
resource "docker_image" "example_image" {
  name         = "nginx:1.23.2"
  keep_locally = true
}

resource "docker_container" "example_container" {
  image = docker_image.example_image.name
  name  = var.container_name
  ports {
    internal = 80
    external = 8089
  }
}
output "container_id" {
  description = "ID of the Docker container"
  value       = docker_container.example_container.id
}

output "image_id" {
  description = "ID of the Docker image"
  value       = docker_image.example_image.id
}
