variable "RouteTable" {
  type = list(object({
    cidr_block      = string
    ipv6_cidr_block = string
    tags            = list(string)
  }))
}

variable "vpc_id" { type = string }
variable "internet_gateway_id" { type = string }
