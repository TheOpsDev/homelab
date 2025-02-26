locals {
  k3s_cluster_fw = {
    inbound_ports =[ "22", "6443", "80", "443" ]
    outbound_ports = [ "53", "80", "443" ]
  }
}

resource "digitalocean_vpc" "homelab" {
  name     = "homelab-network"
  ip_range = "10.10.100.0/23"
  region   = "sfo3"
}

resource "digitalocean_firewall" "k3s_cluster" {
  name = "k3s-cluster"

  dynamic "inbound_rule" {
    for_each = local.k3s_cluster_fw.inbound_ports
    content {
      protocol = "tcp"
      port_range = inbound_rule.value
      source_addresses = sensitive(var.source_cidrs)
    }
  }

  dynamic "outbound_rule" {
    for_each = local.k3s_cluster_fw.outbound_ports
    content {
      protocol = "tcp"
      port_range = outbound_rule.value
      destination_addresses = ["0.0.0.0/0", "::/0"]
    }
  }
}
