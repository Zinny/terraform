#main.tf

terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
      version = "3.6.2"  
    }
  }
}

resource "docker_image" "nginx_image" {
  name = "nginx:latest"
  keep_locally = true
}

resource "docker_container" "nginx_container" {
  name = "my-nginx-app"
  image = docker_image.nginx_image.name
  ports {
    internal = 80
    external = 8085
  }
  start = true
}

output "nginx_url" {
  value = "http://localhost:${docker_container.nginx_container.ports[0].external}"
  description = "URL to access Nginx Container"

}