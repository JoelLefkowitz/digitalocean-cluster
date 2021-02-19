resource "digitalocean_ssh_key" "keys" {
  count      = var.droplet_count
  name       = format("%s-%s-%s", var.project, var.env, count.index)
  public_key = file(format("%s/%s-%s-%s.pub", var.ssh_dir, var.project, var.env, count.index))
}

resource "digitalocean_droplet" "droplets" {
  count              = var.droplet_count
  image              = "ubuntu-18-04-x64"
  name               = format("%s-%s-%s", var.project, var.env, count.index)
  region             = var.region
  size               = "s-1vcpu-1gb"
  private_networking = "true"
  tags = [
    var.env,
    count.index == 0 || count.index == 2 || count.index == 4
    ? "manager"
    : "worker"
  ]
  ssh_keys   = [digitalocean_ssh_key.keys[count.index].fingerprint]
  depends_on = [digitalocean_ssh_key.keys]
}

