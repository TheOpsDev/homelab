locals {
  mx_records = {
    "aspmx.l.google.com"      = 1
    "alt1.aspmx.l.google.com" = 5
    "alt2.aspmx.l.google.com" = 5
    "alt3.aspmx.l.google.com" = 10
    "alt4.aspmx.l.google.com" = 10
  }
}

resource "cloudflare_record" "root_chdotcom" {
  zone_id = cloudflare_zone.chdotcom.id
  name    = "@"
  type    = "CNAME"
  content = "github.com"
  proxied = true
  comment = "Temporary redirect to my Github profile"
}

resource "cloudflare_record" "www_chdotcom" {
  zone_id = cloudflare_zone.chdotcom.id
  name    = "www"
  type    = "CNAME"
  content = "christian-herrera.com"
  proxied = true
}

resource "cloudflare_record" "mx" {
  for_each = local.mx_records

  zone_id  = cloudflare_zone.chdotcom.id
  name     = "christian-herrera.com"
  type     = "MX"
  content  = each.key
  priority = each.value
}
