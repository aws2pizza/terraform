variable "AutoScalingGroup" {
  type = list(object({
    desired_capacity          = number
    max_size                  = number
    min_size                  = number
    health_check_grace_period = number
    health_check_type         = string
    tags                      = list(string)
  }))
}

variable "vpc_zone_identifier" { type = list(string) }
variable "launch_template_id" { type = string }
variable "desired_capacity" { type = number }
variable "max_size" { type = number }
variable "min_size" { type = number }
variable "target_group_arns" { type = list(string) }
