
resource "cloudflare_zone" "theopsdev" {
  account_id = var.cloudflare_account_id
  zone       = "theops.dev"
}

resource "cloudflare_zone" "chdotcom" {
  account_id = var.cloudflare_account_id
  zone       = "christian-herrera.com"
}
