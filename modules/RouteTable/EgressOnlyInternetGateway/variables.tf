variable "RouteTable" {
  type = list(object({
    ipv6_cidr_block = string
    tags            = list(string)
  }))
}

variable "vpc_id" { type = string }
variable "egress_only_internet_gateway_id" { type = string }
