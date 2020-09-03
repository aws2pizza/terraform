variable "CloudWatchMetricAlarm" {
  type = list(object({
    alarm_name          = string
    comparison_operator = string
    metric_name         = string
    statistic           = string
    namespace           = string
    period              = number
    evaluation_periods  = number
    threshold           = number
    tags                = list(string)
  }))
}

variable "AutoScalingGroupName" { type = string }
variable "alarm_actions" { type = list(string) }
variable "ok_actions" { type = list(string) }
