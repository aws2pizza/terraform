resource "aws_route_table_association" "create" {
  count = length(var.subnet_ids) != 0 ? length(var.subnet_ids) : 0

  subnet_id      = var.subnet_ids[count.index]
  route_table_id = var.route_table_id
}
