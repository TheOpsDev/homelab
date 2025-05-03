# Create a new domain
data "digitalocean_domain" "theopsdev" {
  name = "do.theops.dev"
}

resource "digitalocean_record" "k3s_theopsdev" {
  domain = data.digitalocean_domain.theopsdev.name
  type   = "A"
  name   = "k3s"
  value  = sensitive(module.k3s-controlplane.ipv4_address)
}
