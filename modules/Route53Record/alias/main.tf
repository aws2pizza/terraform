resource "aws_route53_record" "create" {
  count = length(var.Route53Record[0].records.alias) != 0 ? length(var.Route53Record[0].records.alias) : 0

  zone_id = var.zone_id
  name    = var.Route53Record[0].records.alias[count.index].name
  type    = var.Route53Record[0].records.alias[count.index].type

  alias {
    name                   = var.load_balancer_dns_name
    zone_id                = var.load_balancer_zone_id
    evaluate_target_health = var.Route53Record[0].records.alias[count.index].evaluate_target_health
  }
}
