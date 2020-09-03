#########################################################
# MODULE: AutoScalingGroup
#########################################################
locals {
  _checkAutoScalingGroup = length([for i in var.AutoScalingGroup : i if i.tags[1] == var.main_id]) != 0 ? [for i in var.AutoScalingGroup : i if i.tags[1] == var.main_id] : []
}

module "AutoScalingGroup_JumpBox" {
  source              = "./modules/AutoScalingGroup"
  launch_template_id  = length(local.VirtualPrivateCloud) != 0 ? module.LaunchTemplate_JumpBox.output[0].id : ""
  vpc_zone_identifier = length(local.VirtualPrivateCloud) != 0 ? [for i in local.SubnetAll : i.id if i.tags._tag02_union == "JumpBox"] : []
  desired_capacity    = length(local.VirtualPrivateCloud) != 0 ? [for i in local._checkAutoScalingGroup : i.desired_capacity if i.tags[2] == "JumpBox"][0] : 1
  max_size            = length(local.VirtualPrivateCloud) != 0 ? [for i in local._checkAutoScalingGroup : i.max_size if i.tags[2] == "JumpBox"][0] : 1
  min_size            = length(local.VirtualPrivateCloud) != 0 ? [for i in local._checkAutoScalingGroup : i.min_size if i.tags[2] == "JumpBox"][0] : 1
  target_group_arns   = length(local.VirtualPrivateCloud) != 0 ? [] : []
  AutoScalingGroup    = length(local.VirtualPrivateCloud) != 0 ? [for i in local._checkAutoScalingGroup : i if i.tags[2] == "JumpBox"] : []
}
module "AutoScalingGroup_WebServer" {
  source              = "./modules/AutoScalingGroup"
  launch_template_id  = length(local.VirtualPrivateCloud) != 0 ? module.LaunchTemplate_WebServer.output[0].id : ""
  vpc_zone_identifier = length(local.VirtualPrivateCloud) != 0 ? [for i in local.SubnetAll : i.id if i.tags._tag02_union == "WebServer"] : []
  desired_capacity    = length(local.VirtualPrivateCloud) != 0 ? local.CountAvailabilityZones : 1
  max_size            = length(local.VirtualPrivateCloud) != 0 ? local.CountAvailabilityZones * 2 : 1
  min_size            = length(local.VirtualPrivateCloud) != 0 ? local.CountAvailabilityZones : 1
  target_group_arns   = length(local.VirtualPrivateCloud) != 0 ? [module.TargetGroup_WebServer.output[0].arn] : []
  AutoScalingGroup    = length(local.VirtualPrivateCloud) != 0 ? [for i in local._checkAutoScalingGroup : i if i.tags[2] == "WebServer"] : []
}
