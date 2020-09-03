resource "aws_autoscaling_group" "create" {
  count = length(var.AutoScalingGroup) != 0 ? length(var.AutoScalingGroup) : 0

  name = format("%s%s%s%s%s",
    var.AutoScalingGroup[count.index].tags[0],
    var.AutoScalingGroup[count.index].tags[1] != "null" ? format("-%s", var.AutoScalingGroup[count.index].tags[1]) : "",
    var.AutoScalingGroup[count.index].tags[2] != "null" ? format("-%s", var.AutoScalingGroup[count.index].tags[2]) : "",
    var.AutoScalingGroup[count.index].tags[3] != "null" ? format("-%s", var.AutoScalingGroup[count.index].tags[3]) : "",
    var.AutoScalingGroup[count.index].tags[4] != "null" ? format("-%s", var.AutoScalingGroup[count.index].tags[4]) : ""
  )

  desired_capacity          = var.desired_capacity
  max_size                  = var.max_size
  min_size                  = var.min_size
  health_check_grace_period = var.AutoScalingGroup[count.index].health_check_grace_period
  health_check_type         = var.AutoScalingGroup[count.index].health_check_type
  vpc_zone_identifier       = var.vpc_zone_identifier
  target_group_arns         = var.target_group_arns

  launch_template {
    id      = var.launch_template_id
    version = "$Latest"
  }

  tags = [
    { "key" = "Name", "value" = format("%s%s%s%s%s", "EC2Instance",
      var.AutoScalingGroup[count.index].tags[1] != "null" ? format("-%s", var.AutoScalingGroup[count.index].tags[1]) : "",
      var.AutoScalingGroup[count.index].tags[2] != "null" ? format("-%s", var.AutoScalingGroup[count.index].tags[2]) : "",
      var.AutoScalingGroup[count.index].tags[3] != "null" ? format("-%s", var.AutoScalingGroup[count.index].tags[3]) : "",
    var.AutoScalingGroup[count.index].tags[4] != "null" ? format("-%s", var.AutoScalingGroup[count.index].tags[4]) : ""), "propagate_at_launch" = true },
    { "key" = "_tag00_object", "value" = "EC2Instance", "propagate_at_launch" = true },
    { "key" = "_tag01_main_id", "value" = format("%s", var.AutoScalingGroup[count.index].tags[1] != "null" ? var.AutoScalingGroup[count.index].tags[1] : "-"), "propagate_at_launch" = true },
    { "key" = "_tag01_union", "value" = format("%s", var.AutoScalingGroup[count.index].tags[2] != "null" ? var.AutoScalingGroup[count.index].tags[2] : "-"), "propagate_at_launch" = true },
    { "key" = "_tag01_type", "value" = format("%s", var.AutoScalingGroup[count.index].tags[3] != "null" ? var.AutoScalingGroup[count.index].tags[3] : "-"), "propagate_at_launch" = true },
    { "key" = "_tag01_az", "value" = format("%s", var.AutoScalingGroup[count.index].tags[4] != "null" ? var.AutoScalingGroup[count.index].tags[4] : "-"), "propagate_at_launch" = true }
  ]
}
