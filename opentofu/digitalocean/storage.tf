resource "digitalocean_spaces_bucket" "theopsdev" {
  name          = "theopsdev"
  region        = "sfo3"
  acl           = "private"
  force_destroy = false
  versioning {
    enabled = true
  }
}