resource "aws_network_acl" "create" {
  count = length(var.NetworkAccessList) != 0 ? length(var.NetworkAccessList) : 0

  vpc_id     = var.vpc_id
  subnet_ids = var.subnet_ids

  tags = {
    Name = format("%s%s%s%s%s",
      var.NetworkAccessList[count.index].tags[0],
      var.NetworkAccessList[count.index].tags[1] != "null" ? format("-%s", var.NetworkAccessList[count.index].tags[1]) : "",
      var.NetworkAccessList[count.index].tags[2] != "null" ? format("-%s", var.NetworkAccessList[count.index].tags[2]) : "",
      var.NetworkAccessList[count.index].tags[3] != "null" ? format("-%s", var.NetworkAccessList[count.index].tags[3]) : "",
      var.NetworkAccessList[count.index].tags[4] != "null" ? format("-%s", var.NetworkAccessList[count.index].tags[4]) : ""
    )
    _tag00_object  = var.NetworkAccessList[count.index].tags[0] != "null" ? var.NetworkAccessList[count.index].tags[0] : "-"
    _tag01_main_id = var.NetworkAccessList[count.index].tags[1] != "null" ? var.NetworkAccessList[count.index].tags[1] : "-"
    _tag02_union   = var.NetworkAccessList[count.index].tags[2] != "null" ? var.NetworkAccessList[count.index].tags[2] : "-"
    _tag03_type    = var.NetworkAccessList[count.index].tags[3] != "null" ? var.NetworkAccessList[count.index].tags[3] : "-"
    _tag04_az      = var.NetworkAccessList[count.index].tags[4] != "null" ? var.NetworkAccessList[count.index].tags[4] : "-"
  }
}
