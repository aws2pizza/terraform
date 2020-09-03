#########################################################
# MODULE: LoadBalancerListener
#########################################################
locals {
  _checkLoadBalancerListener_http = length([for i in var.LoadBalancerListener_http : i if i.main_id == var.main_id]) != 0 ? [for i in var.LoadBalancerListener_http : i if i.main_id == var.main_id] : []
}

module "LoadBalancerListener_http" {
  source                    = "./modules/LoadBalancerListener/http"
  load_balancer_arn         = length(local.VirtualPrivateCloud) != 0 ? module.LoadBalancer.output[0].arn : ""
  LoadBalancerListener_http = length(local.VirtualPrivateCloud) != 0 ? local._checkLoadBalancerListener_http : []
}


locals {
  _checkLoadBalancerListener_https = length([for i in var.LoadBalancerListener_https : i if i.main_id == var.main_id]) != 0 ? [for i in var.LoadBalancerListener_https : i if i.main_id == var.main_id] : []
}

module "LoadBalancerListener_https" {
  source                     = "./modules/LoadBalancerListener/https"
  load_balancer_arn          = length(local.VirtualPrivateCloud) != 0 ? module.LoadBalancer.output[0].arn : ""
  certificate_arn            = length(local.VirtualPrivateCloud) != 0 ? data.aws_acm_certificate.Certificate01.arn : ""
  target_group_arn           = length(local.VirtualPrivateCloud) != 0 ? module.TargetGroup_WebServer.output[0].arn : ""
  LoadBalancerListener_https = length(local.VirtualPrivateCloud) != 0 ? local._checkLoadBalancerListener_https : []
}
