module "k3s-controlplane" {
  source = "../tofu-modules/do-droplet"

  name         = "k3s-controlplane-1"
  size         = "basic-xs"
  storage_size = 50 # GB

  vpc_id = digitalocean_vpc.homelab.id
  tags   = ["k3s", "controlplane"]
}