variable "TargetGroup" {
  type = list(object({
    target_type                   = string
    port                          = number
    protocol                      = string
    load_balancing_algorithm_type = string
    health_check = object({
      enabled             = bool
      interval            = number
      path                = string
      protocol            = string
      timeout             = number
      healthy_threshold   = number
      unhealthy_threshold = number
      matcher             = string
    })
    tags = list(string)
  }))
}

variable "vpc_id" { type = string }
