variable "Route53Record" {
  type = list(object({
    name    = string
    main_id = string
    records = object({
      alias = list(object({
        name                   = string
        type                   = string
        evaluate_target_health = bool
      }))
    })
  }))
}

variable "zone_id" { type = string }
variable "load_balancer_dns_name" { type = string }
variable "load_balancer_zone_id" { type = string }
