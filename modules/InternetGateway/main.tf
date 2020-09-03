resource "aws_internet_gateway" "create" {
  count = length(var.InternetGateway) != 0 ? length(var.InternetGateway) : 0

  vpc_id = var.vpc_id

  tags = {
    Name = format("%s%s%s%s%s",
      var.InternetGateway[count.index].tags[0],
      var.InternetGateway[count.index].tags[1] != "null" ? format("-%s", var.InternetGateway[count.index].tags[1]) : "",
      var.InternetGateway[count.index].tags[2] != "null" ? format("-%s", var.InternetGateway[count.index].tags[2]) : "",
      var.InternetGateway[count.index].tags[3] != "null" ? format("-%s", var.InternetGateway[count.index].tags[3]) : "",
      var.InternetGateway[count.index].tags[4] != "null" ? format("-%s", var.InternetGateway[count.index].tags[4]) : ""
    )
    _tag00_object  = var.InternetGateway[count.index].tags[0] != "null" ? var.InternetGateway[count.index].tags[0] : "-"
    _tag01_main_id = var.InternetGateway[count.index].tags[1] != "null" ? var.InternetGateway[count.index].tags[1] : "-"
    _tag02_union   = var.InternetGateway[count.index].tags[2] != "null" ? var.InternetGateway[count.index].tags[2] : "-"
    _tag03_type    = var.InternetGateway[count.index].tags[3] != "null" ? var.InternetGateway[count.index].tags[3] : "-"
    _tag04_az      = var.InternetGateway[count.index].tags[4] != "null" ? var.InternetGateway[count.index].tags[4] : "-"
  }
}
