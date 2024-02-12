/* This is first TF code 
 This is used to create NGINX docker container 
 Module to set provider of the Terraform 
*/
terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.22.0"
    }
  }
}

#Module to create the image  
provider "docker" {}

resource "docker_image" "nginx" {
  name         = "nginx:1.19.6"
  keep_locally = true       // keep image after "destroy"
}

/* Module to create the container using the nginx image 
resource "docker_container" "nginx" {
  image = docker_image.nginx.image_id
  name  = "tutorial"
  ports {
    internal = 80
    external = 2224
  }
} 
*/

resource "docker_container" "nginx" {
  image = docker_image.nginx.image_id
  name  = var.container_name
  ports {
    internal = 80
    external = 2224
  }
}

variable "container_name" {
   description ="This will be the name of container being created" 
   default = "docker_first_container" 
}

## End
