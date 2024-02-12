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

resource "docker_image" "UNIQUETERRAFORMIDENTIFIER" {
  name = "nginx:1.25.3"
}
