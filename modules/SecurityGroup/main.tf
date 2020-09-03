resource "aws_security_group" "create" {
  count = length(var.SecurityGroup) != 0 ? length(var.SecurityGroup) : 0

  vpc_id = var.vpc_id

  name = format("%s%s%s%s%s",
    var.SecurityGroup[count.index].tags[0],
    var.SecurityGroup[count.index].tags[1] != "null" ? format("-%s", var.SecurityGroup[count.index].tags[1]) : "",
    var.SecurityGroup[count.index].tags[2] != "null" ? format("-%s", var.SecurityGroup[count.index].tags[2]) : "",
    var.SecurityGroup[count.index].tags[3] != "null" ? format("-%s", var.SecurityGroup[count.index].tags[3]) : "",
    var.SecurityGroup[count.index].tags[4] != "null" ? format("-%s", var.SecurityGroup[count.index].tags[4]) : ""
  )

  tags = {
    Name = format("%s%s%s%s%s",
      var.SecurityGroup[count.index].tags[0],
      var.SecurityGroup[count.index].tags[1] != "null" ? format("-%s", var.SecurityGroup[count.index].tags[1]) : "",
      var.SecurityGroup[count.index].tags[2] != "null" ? format("-%s", var.SecurityGroup[count.index].tags[2]) : "",
      var.SecurityGroup[count.index].tags[3] != "null" ? format("-%s", var.SecurityGroup[count.index].tags[3]) : "",
      var.SecurityGroup[count.index].tags[4] != "null" ? format("-%s", var.SecurityGroup[count.index].tags[4]) : ""
    )
    _tag00_object  = var.SecurityGroup[count.index].tags[0] != "null" ? var.SecurityGroup[count.index].tags[0] : "-"
    _tag01_main_id = var.SecurityGroup[count.index].tags[1] != "null" ? var.SecurityGroup[count.index].tags[1] : "-"
    _tag02_union   = var.SecurityGroup[count.index].tags[2] != "null" ? var.SecurityGroup[count.index].tags[2] : "-"
    _tag03_type    = var.SecurityGroup[count.index].tags[3] != "null" ? var.SecurityGroup[count.index].tags[3] : "-"
    _tag04_az      = var.SecurityGroup[count.index].tags[4] != "null" ? var.SecurityGroup[count.index].tags[4] : "-"
  }
}
