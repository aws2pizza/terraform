resource "aws_subnet" "create" {
  count = length(var.Subnet) != 0 ? length(var.Subnet) : 0

  vpc_id = var.vpc_id

  availability_zone               = format("%s%s", var.region, var.Subnet[count.index].tags[4])
  cidr_block                      = var.Subnet[count.index].cidr_block
  map_public_ip_on_launch         = var.Subnet[count.index].map_public_ip_on_launch
  assign_ipv6_address_on_creation = var.Subnet[count.index].assign_ipv6_address_on_creation
  ipv6_cidr_block = format("%s:%s:%s:%s%s::%s",
    split(":", var.vpc_ipv6_cidr_block)[0],
    split(":", var.vpc_ipv6_cidr_block)[1],
    split(":", var.vpc_ipv6_cidr_block)[2],
    trimsuffix(format("%s", split(":", var.vpc_ipv6_cidr_block)[3]), "00"),
    split(".", var.Subnet[count.index].cidr_block)[2],
    "/64"
  )

  tags = {
    Name = format("%s%s%s%s%s",
      var.Subnet[count.index].tags[0],
      var.Subnet[count.index].tags[1] != "null" ? format("-%s", var.Subnet[count.index].tags[1]) : "",
      var.Subnet[count.index].tags[2] != "null" ? format("-%s", var.Subnet[count.index].tags[2]) : "",
      var.Subnet[count.index].tags[3] != "null" ? format("-%s", var.Subnet[count.index].tags[3]) : "",
      var.Subnet[count.index].tags[4] != "null" ? format("-%s", var.Subnet[count.index].tags[4]) : ""
    )
    _tag00_object  = var.Subnet[count.index].tags[0] != "null" ? var.Subnet[count.index].tags[0] : "-"
    _tag01_main_id = var.Subnet[count.index].tags[1] != "null" ? var.Subnet[count.index].tags[1] : "-"
    _tag02_union   = var.Subnet[count.index].tags[2] != "null" ? var.Subnet[count.index].tags[2] : "-"
    _tag03_type    = var.Subnet[count.index].tags[3] != "null" ? var.Subnet[count.index].tags[3] : "-"
    _tag04_az      = var.Subnet[count.index].tags[4] != "null" ? var.Subnet[count.index].tags[4] : "-"
  }
}
