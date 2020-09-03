resource "aws_route53_zone" "create" {
  count = length(var.Route53) != 0 ? length(var.Route53) : 0

  name          = var.Route53[count.index].name
  force_destroy = var.Route53[count.index].force_destroy

  tags = {
    Name = format("%s%s%s%s%s",
      var.Route53[count.index].tags[0],
      var.Route53[count.index].tags[1] != "null" ? format("-%s", var.Route53[count.index].tags[1]) : "",
      var.Route53[count.index].tags[2] != "null" ? format("-%s", var.Route53[count.index].tags[2]) : format("-%s", var.Route53[count.index].name),
      var.Route53[count.index].tags[3] != "null" ? format("-%s", var.Route53[count.index].tags[3]) : "",
      var.Route53[count.index].tags[4] != "null" ? format("-%s", var.Route53[count.index].tags[4]) : ""
    )
    _tag00_object  = var.Route53[count.index].tags[0] != "null" ? var.Route53[count.index].tags[0] : "-"
    _tag01_main_id = var.Route53[count.index].tags[1] != "null" ? var.Route53[count.index].tags[1] : "-"
    _tag02_union   = var.Route53[count.index].tags[2] != "null" ? var.Route53[count.index].tags[2] : var.Route53[count.index].name
    _tag03_type    = var.Route53[count.index].tags[3] != "null" ? var.Route53[count.index].tags[3] : "-"
    _tag04_az      = var.Route53[count.index].tags[4] != "null" ? var.Route53[count.index].tags[4] : "-"
  }
}
