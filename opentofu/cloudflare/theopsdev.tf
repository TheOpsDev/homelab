locals {
  opsdev_mx_records = {
    "route1.mx.cloudflare.net." = 78
    "route2.mx.cloudflare.net." = 42
    "route3.mx.cloudflare.net." = 100
  }
}

resource "cloudflare_record" "root_theopsdev" {
  zone_id = cloudflare_zone.theopsdev.id
  name    = "@"
  type    = "CNAME"
  content = "github.com"
  proxied = true
  comment = "Temporary redirect to my Github profile"
}

resource "cloudflare_record" "www_theopsdev" {
  zone_id = cloudflare_zone.theopsdev.id
  name    = "www"
  type    = "CNAME"
  content = "theops.dev"
  proxied = true
}

resource "cloudflare_record" "blog_theopsdev" {
  zone_id = cloudflare_zone.theopsdev.id
  name    = "blog"
  type    = "CNAME"
  content = "hashnode.network"
  proxied = false
}

resource "cloudflare_record" "linkedin_theopsdev" {
  zone_id = cloudflare_zone.theopsdev.id
  name    = "linkedin"
  type    = "CNAME"
  content = "linkedin.com"
  proxied = true
}

resource "cloudflare_record" "mx_opsdev" {
  for_each = local.opsdev_mx_records

  zone_id  = cloudflare_zone.theopsdev.id
  name     = "theops.dev"
  type     = "MX"
  content  = each.key
  priority = each.value
}

resource "cloudflare_record" "txt_opsdev" {
  zone_id = cloudflare_zone.theopsdev.id
  name    = "theops.dev"
  type    = "TXT"
  content = "v=spf1 include:_spf.mx.cloudflare.net ~all"
}

resource "cloudflare_record" "do_theopsdev" {
  for_each = toset([
    "ns1.digitalocean.com",
    "ns2.digitalocean.com",
    "ns3.digitalocean.com"
  ])

  zone_id = cloudflare_zone.theopsdev.id
  name    = "do"
  type    = "NS"
  content = each.value
  proxied = false

}

resource "cloudflare_email_routing_rule" "chris_theopsdev" {
  zone_id = cloudflare_zone.theopsdev.id
  name    = "chris-theopsdev"
  enabled = true

  matcher {
    type  = "literal"
    field = "to"
    value = "chris@theops.dev"
  }

  action {
    type  = "forward"
    value = ["christian@christian-herrera.com"]
  }
}

resource "cloudflare_email_routing_rule" "admin_theopsdev" {
  zone_id = cloudflare_zone.theopsdev.id
  name    = "admin-theopsdev"
  enabled = true

  matcher {
    type  = "literal"
    field = "to"
    value = "admin@theops.dev"
  }

  action {
    type  = "forward"
    value = ["christian@christian-herrera.com"]
  }
}

resource "cloudflare_page_rule" "linkedin_theopsdev" {
  zone_id  = cloudflare_zone.theopsdev.id
  target   = "linkedin.theops.dev/*"
  priority = 1

  actions {
    forwarding_url {
      url         = "https://linkedin.com/in/theopsdev"
      status_code = 301
    }
  }
}
