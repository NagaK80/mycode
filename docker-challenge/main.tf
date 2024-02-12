terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "3.0.2"
    }
  }
}

provider "docker" {
}

resource "docker_image" "simplegoservice" {
  name = "registry.gitlab.com/alta3/simplegoservice"
}

# Create a container
resource "docker_container" "simplegoservice" {
  image = docker_image.simplegoservice.image_id
  name  = var.container_name
  ports { 
     external = var.extport
     internal = var.intport
  }
}

