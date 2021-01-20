resource "digitalocean_ssh_key" "cluster_keys" {
  count      = var.droplet_count
  name       = format("DO%s", count.index)
  public_key = file(format("~/.ssh/%s/DO%s.pub", var.ssh_subdir, count.index))
}

resource "digitalocean_droplet" "cluster_droplets" {
  count              = var.droplet_count
  image              = "ubuntu-18-04-x64"
  name               = format("%s-%s%s", var.deploy_env, var.deploy_stack, count.index)
  region             = var.region
  size               = "s-1vcpu-1gb"
  private_networking = "true"
  tags               = [count.index <= 2 ? "manager" : "worker"]
  ssh_keys           = [digitalocean_ssh_key.cluster_keys[count.index].fingerprint]
  depends_on         = [digitalocean_ssh_key.cluster_keys]
}

