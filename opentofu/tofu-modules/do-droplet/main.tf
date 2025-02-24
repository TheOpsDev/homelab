locals {
  tags = toset(concat([
    "opentofu",
    "do-droplet",
    var.region,
    var.name,
    var.droplet_image,
  ], var.tags))
}

data "digitalocean_ssh_key" "macbook" {
  name = "Personal Macbook"
  
}

resource "digitalocean_volume" "opsdev" {
  region                  = var.region
  name                    = var.name
  size                    = var.storage_size
  initial_filesystem_type = var.storage_type
  description             = "Volume for ${var.name}"
  tags                    = local.tags
}

resource "digitalocean_droplet" "opsdev" {
  image    = var.droplet_image
  name     = var.name
  region   = var.region
  size     = var.size
  vpc_uuid = var.vpc_id
  tags     = local.tags
  ssh_keys = [ data.digitalocean_ssh_key.macbook.id ]
}

resource "digitalocean_volume_attachment" "opsdev" {
  droplet_id = digitalocean_droplet.opsdev.id
  volume_id  = digitalocean_volume.opsdev.id
}

