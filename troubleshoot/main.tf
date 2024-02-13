terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "3.0.2"
    }
  }
}

provider "docker" {}
  
resource "docker_image" "nginx" {
  name         = "nginx:1.23.2"
  keep_locally = true
}

resource "docker_container" "nginx" {
  image = docker_image.nginx.name
  name  = var.container_name
  ports {
    internal = 80
    external = 8089
  }
}
output "container_id" {
  description = "ID of the Docker container"
  value       = docker_container.nginx.id
}

output "image_id" {
  description = "ID of the Docker image"
  value       = docker_image.nginx.id
} 

variable "container_name" {
   description = "Defines the name" 
   default = "TroubleshootDocker" 
   type = string
}