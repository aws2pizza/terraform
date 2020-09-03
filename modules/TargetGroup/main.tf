resource "aws_lb_target_group" "create" {
  count = length(var.TargetGroup) != 0 ? length(var.TargetGroup) : 0

  name = format("%s%s%s%s%s",
    var.TargetGroup[count.index].tags[0],
    var.TargetGroup[count.index].tags[1] != "null" ? format("-%s", var.TargetGroup[count.index].tags[1]) : "",
    var.TargetGroup[count.index].tags[2] != "null" ? format("-%s", var.TargetGroup[count.index].tags[2]) : "",
    var.TargetGroup[count.index].tags[3] != "null" ? format("-%s", var.TargetGroup[count.index].tags[3]) : "",
    var.TargetGroup[count.index].tags[4] != "null" ? format("-%s", var.TargetGroup[count.index].tags[4]) : ""
  )

  vpc_id = var.vpc_id

  target_type                   = var.TargetGroup[count.index].target_type
  port                          = var.TargetGroup[count.index].port
  protocol                      = var.TargetGroup[count.index].protocol
  load_balancing_algorithm_type = var.TargetGroup[count.index].load_balancing_algorithm_type
  health_check {
    enabled             = var.TargetGroup[count.index].health_check.enabled
    interval            = var.TargetGroup[count.index].health_check.interval
    path                = var.TargetGroup[count.index].health_check.path
    protocol            = var.TargetGroup[count.index].health_check.protocol
    timeout             = var.TargetGroup[count.index].health_check.timeout
    healthy_threshold   = var.TargetGroup[count.index].health_check.healthy_threshold
    unhealthy_threshold = var.TargetGroup[count.index].health_check.unhealthy_threshold
    matcher             = var.TargetGroup[count.index].health_check.matcher
  }

  tags = {
    Name = format("%s%s%s%s%s",
      var.TargetGroup[count.index].tags[0],
      var.TargetGroup[count.index].tags[1] != "null" ? format("-%s", var.TargetGroup[count.index].tags[1]) : "",
      var.TargetGroup[count.index].tags[2] != "null" ? format("-%s", var.TargetGroup[count.index].tags[2]) : "",
      var.TargetGroup[count.index].tags[3] != "null" ? format("-%s", var.TargetGroup[count.index].tags[3]) : "",
      var.TargetGroup[count.index].tags[4] != "null" ? format("-%s", var.TargetGroup[count.index].tags[4]) : ""
    )
    _tag00_object  = var.TargetGroup[count.index].tags[0] != "null" ? var.TargetGroup[count.index].tags[0] : "-"
    _tag01_main_id = var.TargetGroup[count.index].tags[1] != "null" ? var.TargetGroup[count.index].tags[1] : "-"
    _tag02_union   = var.TargetGroup[count.index].tags[2] != "null" ? var.TargetGroup[count.index].tags[2] : "-"
    _tag03_type    = var.TargetGroup[count.index].tags[3] != "null" ? var.TargetGroup[count.index].tags[3] : "-"
    _tag04_az      = var.TargetGroup[count.index].tags[4] != "null" ? var.TargetGroup[count.index].tags[4] : "-"
  }
}
