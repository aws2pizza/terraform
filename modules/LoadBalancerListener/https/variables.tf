variable "LoadBalancerListener_https" {
  type = list(object({
    main_id             = string
    protocol            = string
    port                = string
    ssl_policy          = string
    default_action_type = string
  }))
}

variable "load_balancer_arn" { type = string }
variable "certificate_arn" { type = string }
variable "target_group_arn" { type = string }