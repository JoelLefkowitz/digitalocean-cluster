resource "digitalocean_project" "cluster_project" {
  name        = format("%s %s %s", var.project, var.deploy_env, var.deploy_stack)
  description = format("%s %s %s resources", var.project, var.deploy_env, var.deploy_stack)
  purpose     = "Web Application"
  environment = var.deploy_env
  resources   = [
      for droplet in digitalocean_droplet.cluster_droplets: 
      droplet.urn
    ]
  depends_on = [digitalocean_droplet.cluster_droplets]
}

resource "digitalocean_domain" "cluster_domain" {
  count      = var.droplet_count > 0 ? 1 : 0
  name       = var.domain_name
  ip_address = digitalocean_floating_ip.cluster_floating_ip[0].ip_address
  depends_on = [digitalocean_droplet.cluster_droplets]
}

resource "digitalocean_floating_ip" "cluster_floating_ip" {
  count      = var.droplet_count > 0 ? 1 : 0
  droplet_id = digitalocean_droplet.cluster_droplets[0].id
  region     = digitalocean_droplet.cluster_droplets[0].region
  depends_on = [digitalocean_droplet.cluster_droplets]
}