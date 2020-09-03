resource "aws_egress_only_internet_gateway" "create" {
  count = length(var.EgressOnlyInternetGateway) != 0 ? length(var.EgressOnlyInternetGateway) : 0

  vpc_id = var.vpc_id

  tags = {
    Name = format("%s%s%s%s%s",
      var.EgressOnlyInternetGateway[count.index].tags[0],
      var.EgressOnlyInternetGateway[count.index].tags[1] != "null" ? format("-%s", var.EgressOnlyInternetGateway[count.index].tags[1]) : "",
      var.EgressOnlyInternetGateway[count.index].tags[2] != "null" ? format("-%s", var.EgressOnlyInternetGateway[count.index].tags[2]) : "",
      var.EgressOnlyInternetGateway[count.index].tags[3] != "null" ? format("-%s", var.EgressOnlyInternetGateway[count.index].tags[3]) : "",
      var.EgressOnlyInternetGateway[count.index].tags[4] != "null" ? format("-%s", var.EgressOnlyInternetGateway[count.index].tags[4]) : ""
    )
    _tag00_object  = var.EgressOnlyInternetGateway[count.index].tags[0] != "null" ? var.EgressOnlyInternetGateway[count.index].tags[0] : "-"
    _tag01_main_id = var.EgressOnlyInternetGateway[count.index].tags[1] != "null" ? var.EgressOnlyInternetGateway[count.index].tags[1] : "-"
    _tag02_union   = var.EgressOnlyInternetGateway[count.index].tags[2] != "null" ? var.EgressOnlyInternetGateway[count.index].tags[2] : "-"
    _tag03_type    = var.EgressOnlyInternetGateway[count.index].tags[3] != "null" ? var.EgressOnlyInternetGateway[count.index].tags[3] : "-"
    _tag03_type    = var.EgressOnlyInternetGateway[count.index].tags[4] != "null" ? var.EgressOnlyInternetGateway[count.index].tags[4] : "-"
  }
}
