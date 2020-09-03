variable "InternetGateway" {
  type = list(object({
    tags = list(string)
  }))
}

variable "vpc_id" { type = string }
