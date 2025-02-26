# Control Plane
module "k3s-controlplane" {
  source = "../tofu-modules/do-droplet"

  name         = "k3s-control-1"
  size         = "s-1vcpu-2gb"
  storage_size = 25 # GB

  vpc_id = digitalocean_vpc.homelab.id
  tags   = ["k3s", "controlplane"]
}

data "digitalocean_droplets" "k3s_cluster" {
  filter {
    key    = "tags"
    values = ["k3s"]
  }
  sort {
    key       = "created_at"
    direction = "desc"
  }
}