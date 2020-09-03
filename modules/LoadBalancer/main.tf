resource "aws_lb" "create" {
  count = length(var.LoadBalancer) != 0 ? length(var.LoadBalancer) : 0

  name = format("%s%s%s%s%s",
    var.LoadBalancer[count.index].tags[0],
    var.LoadBalancer[count.index].tags[1] != "null" ? format("-%s", var.LoadBalancer[count.index].tags[1]) : "",
    var.LoadBalancer[count.index].tags[2] != "null" ? format("-%s", var.LoadBalancer[count.index].tags[2]) : "",
    var.LoadBalancer[count.index].tags[3] != "null" ? format("-%s", var.LoadBalancer[count.index].tags[3]) : "",
    var.LoadBalancer[count.index].tags[4] != "null" ? format("-%s", var.LoadBalancer[count.index].tags[4]) : ""
  )

  load_balancer_type = var.LoadBalancer[count.index].load_balancer_type
  internal           = var.LoadBalancer[count.index].internal
  ip_address_type    = var.LoadBalancer[count.index].ip_address_type
  enable_http2       = var.LoadBalancer[count.index].enable_http2

  subnets         = var.subnets
  security_groups = var.security_groups

  tags = {
    Name = format("%s%s%s%s%s",
      var.LoadBalancer[count.index].tags[0],
      var.LoadBalancer[count.index].tags[1] != "null" ? format("-%s", var.LoadBalancer[count.index].tags[1]) : "",
      var.LoadBalancer[count.index].tags[2] != "null" ? format("-%s", var.LoadBalancer[count.index].tags[2]) : "",
      var.LoadBalancer[count.index].tags[3] != "null" ? format("-%s", var.LoadBalancer[count.index].tags[3]) : "",
      var.LoadBalancer[count.index].tags[4] != "null" ? format("-%s", var.LoadBalancer[count.index].tags[4]) : ""
    )
    _tag00_object  = var.LoadBalancer[count.index].tags[0] != "null" ? var.LoadBalancer[count.index].tags[0] : "-"
    _tag01_main_id = var.LoadBalancer[count.index].tags[1] != "null" ? var.LoadBalancer[count.index].tags[1] : "-"
    _tag02_union   = var.LoadBalancer[count.index].tags[2] != "null" ? var.LoadBalancer[count.index].tags[2] : "-"
    _tag03_type    = var.LoadBalancer[count.index].tags[3] != "null" ? var.LoadBalancer[count.index].tags[3] : "-"
    _tag04_az      = var.LoadBalancer[count.index].tags[4] != "null" ? var.LoadBalancer[count.index].tags[4] : "-"
  }
}
