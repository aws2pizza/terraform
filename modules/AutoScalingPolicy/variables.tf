variable "AutoScalingPolicy" {
  type = list(object({
    name               = string
    policy_type        = string
    adjustment_type    = string
    scaling_adjustment = number
    cooldown           = number
    tags               = list(string)
  }))
}

variable "autoscaling_group_name" { type = string }
