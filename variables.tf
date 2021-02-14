variable "project" {}

variable "env" {}

variable "droplet_count" {
    default = 0
}

variable "domain" {
    default = null
}

variable "ssh_dir" {
    default = "~/.ssh/"
}

variable "region" {
    default = "lon1"
}
