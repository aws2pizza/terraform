resource "aws_lb_listener" "create" {
  count = length(var.LoadBalancerListener_http) != 0 ? length(var.LoadBalancerListener_http) : 0

  load_balancer_arn = var.load_balancer_arn

  protocol = var.LoadBalancerListener_http[count.index].protocol
  port     = var.LoadBalancerListener_http[count.index].port

  default_action {
    type = var.LoadBalancerListener_http[count.index].default_action_type
    redirect {
      protocol    = var.LoadBalancerListener_http[count.index].redirect.protocol
      port        = var.LoadBalancerListener_http[count.index].redirect.port
      host        = var.LoadBalancerListener_http[count.index].redirect.host
      path        = var.LoadBalancerListener_http[count.index].redirect.path
      query       = var.LoadBalancerListener_http[count.index].redirect.query
      status_code = var.LoadBalancerListener_http[count.index].redirect.status_code
    }
  }

}
