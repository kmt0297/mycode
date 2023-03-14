terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
      version = "3.0.1"
    }
  }
}

provider "docker" {}

resource "docker_image" "simplegoservice" {
  name         = "registry.gitlab.com/alta3/simplegoservice"
  keep_locally = true    // keep image after "destroy"
}

resource "docker_container" "container"{
    image = docker_image.simplegoservice.name
    name = var.container_name
    ports{
        internal = var.internal_port
        external = var.external_port
    }

}

output "image_id"{
    value = docker_image.simplegoservice.image_id
}

output "container_id"{
   value = docker_container.container.id
}
