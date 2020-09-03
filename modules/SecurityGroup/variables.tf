variable "SecurityGroup" {
  type = list(object({
    tags = list(string)
  }))
}

variable "vpc_id" { type = string }
