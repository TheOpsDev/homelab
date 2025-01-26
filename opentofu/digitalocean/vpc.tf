resource "digitalocean_vpc" "homelab" {
  name     = "homelab-network"
  ip_range = "10.10.100.0/22"
  region   = "sfo3"
}