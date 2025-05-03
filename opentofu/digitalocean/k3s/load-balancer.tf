resource "digitalocean_certificate" "do_theops_dev" {
  name    = "do-theops-dev"
  type    = "lets_encrypt"
  domains = ["*.do.theops.dev"]
}

resource "digitalocean_loadbalancer" "k3s_cluster" {
  name   = "k3s-cluster"
  region = "sfo3"

  forwarding_rule {
    entry_port     = 443
    entry_protocol = "https"

    target_port     = 80
    target_protocol = "http"

    certificate_name = digitalocean_certificate.do_theops_dev.name
  }

  droplet_ids = local.droplet_ids
}