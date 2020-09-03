variable "NetworkAccessListRule" {
  type = list(any)
}

variable "network_acl_id" { type = string }
variable "CidrBlocks" { type = list(string) }
