resource "digitalocean_vpc" "homelab" {
  name     = "homelab-network"
  ip_range = "10.10.100.0/23"
  region   = "sfo3"
}