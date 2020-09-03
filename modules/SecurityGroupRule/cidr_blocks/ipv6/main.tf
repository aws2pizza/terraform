resource "aws_security_group_rule" "create" {
  count = length(var.SecurityGroupRule) != 0 ? 1 : 0

  security_group_id = var.security_group_id
  ipv6_cidr_blocks  = var.CidrBlocks

  type      = var.SecurityGroupRule[0]
  protocol  = var.SecurityGroupRule[1]
  from_port = var.SecurityGroupRule[2]
  to_port   = var.SecurityGroupRule[3]
}
