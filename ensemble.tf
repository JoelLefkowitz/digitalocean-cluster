locals {
  has_domain      = var.domain != null && var.droplet_count > 0
  has_floating_ip = var.has_floating && var.droplet_count > 0

  primary_droplet = (
    length(digitalocean_droplet.droplets) > 0
    ? digitalocean_droplet.droplets[0]
    : null
  )

  primary_floating_ip = (
    length(digitalocean_floating_ip.floating_ips) > 0
    ? digitalocean_floating_ip.floating_ips[0]
    : null
  )
}

resource "digitalocean_project" "projects" {
  name        = format("%s %s", var.project, var.env)
  description = format("%s %s resources", var.project, var.env)
  purpose     = "Web Application"
  environment = var.env
  resources = flatten([
    [for domain in digitalocean_domain.domains : domain.urn],
    [for droplet in digitalocean_droplet.droplets : droplet.urn]
  ])
  depends_on = [
    digitalocean_domain.domains,
    digitalocean_droplet.droplets
  ]
}

resource "digitalocean_floating_ip" "floating_ips" {
  count      = local.has_floating_ip ? 1 : 0
  droplet_id = local.primary_droplet.id
  region     = local.primary_droplet.region
  depends_on = [digitalocean_droplet.droplets]
}

resource "digitalocean_domain" "domains" {
  name  = var.domain
  count = local.has_domain ? 1 : 0
  ip_address = (
    var.has_floating
    ? local.primary_floating_ip.ip_address
    : local.primary_droplet.ipv4_address
  )
  depends_on = [
    digitalocean_droplet.droplets,
    digitalocean_floating_ip.floating_ips
  ]
}
