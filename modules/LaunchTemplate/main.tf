resource "aws_launch_template" "create" {
  count = length(var.LaunchTemplate) != 0 ? length(var.LaunchTemplate) : 0

  name = format("%s%s%s%s%s",
    var.LaunchTemplate[count.index].tags[0],
    var.LaunchTemplate[count.index].tags[1] != "null" ? format("-%s", var.LaunchTemplate[count.index].tags[1]) : "",
    var.LaunchTemplate[count.index].tags[2] != "null" ? format("-%s", var.LaunchTemplate[count.index].tags[2]) : "",
    var.LaunchTemplate[count.index].tags[3] != "null" ? format("-%s", var.LaunchTemplate[count.index].tags[3]) : "",
    var.LaunchTemplate[count.index].tags[4] != "null" ? format("-%s", var.LaunchTemplate[count.index].tags[4]) : ""
  )

  block_device_mappings {
    device_name = var.LaunchTemplate[count.index].block_device_mappings.device_name
    ebs {
      volume_type           = var.LaunchTemplate[count.index].block_device_mappings.ebs.volume_type
      volume_size           = var.LaunchTemplate[count.index].block_device_mappings.ebs.volume_size
      encrypted             = var.LaunchTemplate[count.index].block_device_mappings.ebs.encrypted
      delete_on_termination = var.LaunchTemplate[count.index].block_device_mappings.ebs.delete_on_termination
    }
  }

  key_name                             = var.LaunchTemplate[count.index].key_name
  instance_initiated_shutdown_behavior = var.LaunchTemplate[count.index].instance_initiated_shutdown_behavior
  instance_type                        = var.LaunchTemplate[count.index].instance_type

  image_id               = var.image_id
  vpc_security_group_ids = var.vpc_security_group_ids
  user_data              = var.user_data

  tags = {
    Name = format("%s%s%s%s%s",
      var.LaunchTemplate[count.index].tags[0],
      var.LaunchTemplate[count.index].tags[1] != "null" ? format("-%s", var.LaunchTemplate[count.index].tags[1]) : "",
      var.LaunchTemplate[count.index].tags[2] != "null" ? format("-%s", var.LaunchTemplate[count.index].tags[2]) : "",
      var.LaunchTemplate[count.index].tags[3] != "null" ? format("-%s", var.LaunchTemplate[count.index].tags[3]) : "",
      var.LaunchTemplate[count.index].tags[4] != "null" ? format("-%s", var.LaunchTemplate[count.index].tags[4]) : ""
    )
    _tag00_object  = var.LaunchTemplate[count.index].tags[0] != "null" ? var.LaunchTemplate[count.index].tags[0] : "-"
    _tag01_main_id = var.LaunchTemplate[count.index].tags[1] != "null" ? var.LaunchTemplate[count.index].tags[1] : "-"
    _tag02_union   = var.LaunchTemplate[count.index].tags[2] != "null" ? var.LaunchTemplate[count.index].tags[2] : "-"
    _tag03_type    = var.LaunchTemplate[count.index].tags[3] != "null" ? var.LaunchTemplate[count.index].tags[3] : "-"
    _tag04_az      = var.LaunchTemplate[count.index].tags[4] != "null" ? var.LaunchTemplate[count.index].tags[4] : "-"
  }
}
