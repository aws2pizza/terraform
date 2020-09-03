variable "LoadBalancer" {
  type = list(object({
    load_balancer_type = string
    internal           = bool
    ip_address_type    = string
    enable_http2       = bool
    tags               = list(string)
  }))
}

variable "subnets" { type = list(string) }
variable "security_groups" { type = list(string) }
