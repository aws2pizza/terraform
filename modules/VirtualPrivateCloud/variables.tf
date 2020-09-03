variable "VirtualPrivateCloud" {
  type = list(object({
    assign_generated_ipv6_cidr_block = bool
    cidr_block                       = string
    enable_dns_hostnames             = bool
    enable_dns_support               = bool
    instance_tenancy                 = string
    tags                             = list(string)
  }))
}
