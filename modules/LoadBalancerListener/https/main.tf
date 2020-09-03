resource "aws_lb_listener" "create" {
  count = length(var.LoadBalancerListener_https) != 0 ? length(var.LoadBalancerListener_https) : 0

  load_balancer_arn = var.load_balancer_arn
  certificate_arn   = var.certificate_arn

  protocol   = var.LoadBalancerListener_https[count.index].protocol
  port       = var.LoadBalancerListener_https[count.index].port
  ssl_policy = var.LoadBalancerListener_https[count.index].ssl_policy

  default_action {
    type             = var.LoadBalancerListener_https[count.index].default_action_type
    target_group_arn = var.target_group_arn
  }

}
