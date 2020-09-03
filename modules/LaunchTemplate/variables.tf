variable "LaunchTemplate" {
  type = list(object({
    tags = list(string)
    block_device_mappings = object({
      device_name = string
      ebs = object({
        volume_type           = string
        volume_size           = string
        delete_on_termination = bool
        encrypted             = bool
      })
    })
    key_name                             = string
    instance_initiated_shutdown_behavior = string
    instance_type                        = string
    })
  )
}

variable "image_id" { type = string }
variable "vpc_security_group_ids" { type = list }
variable "user_data" { type = string }
