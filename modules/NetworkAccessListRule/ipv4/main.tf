resource "aws_network_acl_rule" "create" {
  count = length(var.CidrBlocks) != 0 ? length(var.CidrBlocks) : 0

  network_acl_id = var.network_acl_id
  cidr_block     = var.CidrBlocks[count.index]

  rule_number = length(var.CidrBlocks) == 1 ? var.NetworkAccessListRule[0] + 1 : var.NetworkAccessListRule[0] + 1 + count.index
  egress      = var.NetworkAccessListRule[1]
  protocol    = var.NetworkAccessListRule[2]
  rule_action = var.NetworkAccessListRule[3]
  from_port   = var.NetworkAccessListRule[4]
  to_port     = var.NetworkAccessListRule[5]
}
