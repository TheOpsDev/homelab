data "digitalocean_domain" "theopsdev" {
  name = "do.theops.dev"
}

data "digitalocean_loadbalancer" "doks" {
  name = "${sensitive(var.k8s_lb_name)}"
}

resource "digitalocean_record" "k8s_ipv4" {
  domain = data.digitalocean_domain.theopsdev.name
  type   = "A"
  name   = "*"
  value  = sensitive(data.digitalocean_loadbalancer.doks.ip)
  ttl    = 300
}

