# Create a new domain
resource "digitalocean_domain" "theopsdev" {
  name = "do.theops.dev"
}

resource "digitalocean_record" "k3s_theopsdev" {
  domain = digitalocean_domain.theopsdev.name
  type   = "A"
  name   = "k3s"
  value  = module.k3s-controlplane.ipv4_address
}
