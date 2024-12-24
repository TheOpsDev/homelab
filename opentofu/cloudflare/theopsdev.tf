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

resource "cloudflare_page_rule" "redirect_all_traffic" {
  zone_id = cloudflare_zone.theopsdev.id
  target  = cloudflare_zone.theopsdev.zone

  actions {
    forwarding_url {
      url         = "https://github.com/TheOpsDev/"
      status_code = 301
    }
  }
}
