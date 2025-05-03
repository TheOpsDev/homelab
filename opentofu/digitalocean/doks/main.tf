locals {
  tags = [
    "k8s",
    "homelab",
  ]
  labels = {
    "environment" = "homelab"
    "component"   = "critical"
    "app"         = "k8s"
    "owner"       = "theopsdev"
  }
}

data "digitalocean_vpc" "homelab" {
  name = "homelab-network"
}

resource "digitalocean_kubernetes_cluster" "homelab" {
  name    = "homelab"
  region  = "sfo3"
  version = "1.32.2-do.0"

  vpc_uuid = data.digitalocean_vpc.homelab.id
  tags     = local.tags

  node_pool {
    name       = "default"
    size       = "s-2vcpu-4gb"
    auto_scale = true
    min_nodes  = 2
    max_nodes  = 4

    tags = local.tags
    labels = local.labels
  }

  auto_upgrade = true
  maintenance_policy {
    day          = "sunday"
    start_time = "01:00"
  }
}