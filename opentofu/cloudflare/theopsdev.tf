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
