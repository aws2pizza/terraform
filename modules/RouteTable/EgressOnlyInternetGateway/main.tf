resource "aws_route_table" "create" {
  count = length(var.RouteTable) != 0 ? length(var.RouteTable) : 0

  vpc_id = var.vpc_id

  route {
    egress_only_gateway_id = var.egress_only_internet_gateway_id
    ipv6_cidr_block        = var.RouteTable[count.index].ipv6_cidr_block
  }

  tags = {
    Name = format("%s%s%s%s%s",
      var.RouteTable[count.index].tags[0],
      var.RouteTable[count.index].tags[1] != "null" ? format("-%s", var.RouteTable[count.index].tags[1]) : "",
      var.RouteTable[count.index].tags[2] != "null" ? format("-%s", var.RouteTable[count.index].tags[2]) : "",
      var.RouteTable[count.index].tags[3] != "null" ? format("-%s", var.RouteTable[count.index].tags[3]) : "",
      var.RouteTable[count.index].tags[4] != "null" ? format("-%s", var.RouteTable[count.index].tags[4]) : ""
    )
    _tag00_object  = var.RouteTable[count.index].tags[0] != "null" ? var.RouteTable[count.index].tags[0] : "-"
    _tag01_main_id = var.RouteTable[count.index].tags[1] != "null" ? var.RouteTable[count.index].tags[1] : "-"
    _tag02_union   = var.RouteTable[count.index].tags[2] != "null" ? var.RouteTable[count.index].tags[2] : "-"
    _tag03_type    = var.RouteTable[count.index].tags[3] != "null" ? var.RouteTable[count.index].tags[3] : "-"
    _tag04_az      = var.RouteTable[count.index].tags[4] != "null" ? var.RouteTable[count.index].tags[4] : "-"
  }
}
