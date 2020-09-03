variable "SecurityGroupRule" {
  type = list(any)
}

variable "security_group_id" { type = string }
variable "CidrBlocks" { type = list(string) }
