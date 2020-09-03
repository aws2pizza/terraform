variable "LoadBalancerListener_http" {
  type = list(object({
    main_id             = string
    protocol            = string
    port                = string
    default_action_type = string
    redirect = object({
      protocol    = string
      port        = string
      host        = string
      path        = string
      query       = string
      status_code = string
    })
  }))
}

variable "load_balancer_arn" { type = string }
