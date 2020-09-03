resource "aws_autoscaling_policy" "create" {
  count = length(var.AutoScalingPolicy) != 0 ? length(var.AutoScalingPolicy) : 0

  autoscaling_group_name = var.autoscaling_group_name

  name               = var.AutoScalingPolicy[count.index].name
  policy_type        = var.AutoScalingPolicy[count.index].policy_type
  adjustment_type    = var.AutoScalingPolicy[count.index].adjustment_type
  scaling_adjustment = var.AutoScalingPolicy[count.index].scaling_adjustment
  cooldown           = var.AutoScalingPolicy[count.index].cooldown
}
