resource "aws_vpc" "create" {
  count = length(var.VirtualPrivateCloud) != 0 ? length(var.VirtualPrivateCloud) : 0

  assign_generated_ipv6_cidr_block = var.VirtualPrivateCloud[count.index].assign_generated_ipv6_cidr_block
  cidr_block                       = var.VirtualPrivateCloud[count.index].cidr_block
  enable_dns_hostnames             = var.VirtualPrivateCloud[count.index].enable_dns_hostnames
  enable_dns_support               = var.VirtualPrivateCloud[count.index].enable_dns_support

  tags = {
    Name = format("%s%s%s%s%s",
      var.VirtualPrivateCloud[count.index].tags[0],
      var.VirtualPrivateCloud[count.index].tags[1] != "null" ? format("-%s", var.VirtualPrivateCloud[count.index].tags[1]) : "",
      var.VirtualPrivateCloud[count.index].tags[2] != "null" ? format("-%s", var.VirtualPrivateCloud[count.index].tags[2]) : "",
      var.VirtualPrivateCloud[count.index].tags[3] != "null" ? format("-%s", var.VirtualPrivateCloud[count.index].tags[3]) : "",
      var.VirtualPrivateCloud[count.index].tags[4] != "null" ? format("-%s", var.VirtualPrivateCloud[count.index].tags[4]) : ""
    )
    _tag00_object  = var.VirtualPrivateCloud[count.index].tags[0] != "null" ? var.VirtualPrivateCloud[count.index].tags[0] : "-"
    _tag01_main_id = var.VirtualPrivateCloud[count.index].tags[1] != "null" ? var.VirtualPrivateCloud[count.index].tags[1] : "-"
    _tag02_union   = var.VirtualPrivateCloud[count.index].tags[2] != "null" ? var.VirtualPrivateCloud[count.index].tags[2] : "-"
    _tag03_type    = var.VirtualPrivateCloud[count.index].tags[3] != "null" ? var.VirtualPrivateCloud[count.index].tags[3] : "-"
    _tag04_az      = var.VirtualPrivateCloud[count.index].tags[4] != "null" ? var.VirtualPrivateCloud[count.index].tags[4] : "-"
  }
}
