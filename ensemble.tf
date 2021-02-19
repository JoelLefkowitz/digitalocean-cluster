resource "digitalocean_project" "project" {
  name        = format("%s %s", var.project, var.env)
  description = format("%s %s resources", var.project, var.env)
  purpose     = "Web Application"
  environment = var.env
  resources   = [
      for domain in digitalocean_domain.domains: 
      droplet.urn,
      for droplet in digitalocean_droplet.droplets: 
      droplet.urn
    ]
  depends_on = [
    digitalocean_droplet.droplets,
    digitalocean_domain.domains
  ]
}

resource "digitalocean_domain" "domain" {
  name       = var.domain
  count      = var.domain != null && var.droplet_count > 0 ? 1 : 0
  ip_address = digitalocean_floating_ip.floating_ip[0].ip_address
  depends_on = [digitalocean_droplet.droplets]
}

resource "digitalocean_floating_ip" "floating_ip" {
  count      = var.droplet_count > 0 ? 1 : 0
  droplet_id = digitalocean_droplet.droplets[0].id
  region     = digitalocean_droplet.droplets[0].region
  depends_on = [digitalocean_droplet.droplets]
}