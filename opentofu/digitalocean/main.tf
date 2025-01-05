resource "digitalocean_project" "homelab" {
  name        = "homelab"
  description = "A cloud implementation of my local homelab for experimentation"
  purpose     = "Class project / Educational purposes"
  environment = "Development"
  is_default  = true
}

resource "digitalocean_tag" "homelab" {
  name = "homelab"
}

resource "digitalocean_tag" "dev_env" {
  name = "dev"
}