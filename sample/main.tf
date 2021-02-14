terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "~> 1.22"
    }
  }
}

provider "digitalocean" {
  token = var.DO_ACCESS_TOKEN
}

module "sample" {
  source = "../tornado"
  
  project = "sample"
  env = "production"
  
  droplet_count = 10
  domain = "example.com"
  ssh_dir = "~/.ssh/sample"
}
