variable "droplet_image" {
  type        = string
  default     = "ubuntu-24-10-x64"
  description = "The image to use for the Droplet"
}

variable "name" {
  type        = string
  description = "The name of the Droplet"
}

variable "region" {
  type        = string
  default     = "sfo3"
  description = "The region to create the Droplet in"
}

variable "size" {
  type        = string
  default     = "basic-xs"
  description = "The size of the Droplet"

  validation {
    condition     = contains(["s-1vcpu-2gb", "s-2vcpu-2gb", "s-2vcpu-4gb", "s-2vcpu-8gb", "g-2vcpu-8gb"], var.size)
    error_message = "Invalid Droplet size. Must be one of: s-1vcpu-2gb, s-2vcpu-2gb, s-2vcpu-4gb, s-2vcpu-8gb, g-2vcpu-8gb"
  }
}

variable "vpc_id" {
  type        = string
  description = "The VPC ID to create the Droplet in"
}

variable "tags" {
  type        = list(string)
  default     = []
  description = "A list of tags to apply to the Droplet"
}

variable "storage_size" {
  type        = number
  default     = 100
  description = "The size of the volume in GB"

}

variable "storage_type" {
  type        = string
  default     = "ext4"
  description = "The filesystem type to use for the volume"
}