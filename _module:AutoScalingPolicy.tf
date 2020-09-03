#########################################################
# MODULE: AutoScalingPolicy
#########################################################
locals {
  _checkAutoScalingPolicy = length([for i in var.AutoScalingPolicy : i if i.tags[1] == var.main_id]) != 0 ? [for i in var.AutoScalingPolicy : i if i.tags[1] == var.main_id] : []
}

module "AutoScalingPolicy_JumpBox" {
  source                 = "./modules/AutoScalingPolicy"
  autoscaling_group_name = length(local.VirtualPrivateCloud) != 0 ? module.AutoScalingGroup_JumpBox.output[0].name : ""
  AutoScalingPolicy      = length(local.VirtualPrivateCloud) != 0 ? [for i in local._checkAutoScalingPolicy : i if i.tags[2] == "JumpBox"] : []
}
module "AutoScalingPolicy_WebServer" {
  source                 = "./modules/AutoScalingPolicy"
  autoscaling_group_name = length(local.VirtualPrivateCloud) != 0 ? module.AutoScalingGroup_WebServer.output[0].name : ""
  AutoScalingPolicy      = length(local.VirtualPrivateCloud) != 0 ? [for i in local._checkAutoScalingPolicy : i if i.tags[2] == "WebServer"] : []
}
