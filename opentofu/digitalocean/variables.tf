variable "source_cidrs" {
  type        = list(string)
  description = "List of CIDRs to allow traffic from"
  default = [ "" ]
}