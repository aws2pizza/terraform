variable "Subnet" {
  type = list(object({
    cidr_block                      = string
    map_public_ip_on_launch         = bool
    assign_ipv6_address_on_creation = bool
    #ipv6_cidr_block                 = string
    tags = list(string)
  }))
}

variable "region" { type = string }
variable "vpc_id" { type = string }
variable "vpc_ipv6_cidr_block" { type = string }
