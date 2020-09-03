#########################################################
# MODULE: CloudWatchMetricAlarm
#########################################################
locals {
  _checkCloudWatchMetricAlarm = length([for i in var.CloudWatchMetricAlarm : i if i.tags[1] == var.main_id]) != 0 ? [for i in var.CloudWatchMetricAlarm : i if i.tags[1] == var.main_id] : []
}

module "CloudWatchMetricAlarm_JumpBox" {
  source                = "./modules/CloudWatchMetricAlarm"
  AutoScalingGroupName  = length(local.VirtualPrivateCloud) != 0 ? module.AutoScalingGroup_JumpBox.output[0].name : ""
  alarm_actions         = length(local.VirtualPrivateCloud) != 0 ? [for i in module.AutoScalingPolicy_JumpBox.output : i.arn if i.name == "IncreaseGroupSize"] : []
  ok_actions            = length(local.VirtualPrivateCloud) != 0 ? [for i in module.AutoScalingPolicy_JumpBox.output : i.arn if i.name == "DecreaseGroupSize"] : []
  CloudWatchMetricAlarm = length(local.VirtualPrivateCloud) != 0 ? [for i in local._checkCloudWatchMetricAlarm : i if i.tags[2] == "JumpBox"] : []
}
module "CloudWatchMetricAlarm_WebServer" {
  source                = "./modules/CloudWatchMetricAlarm"
  AutoScalingGroupName  = length(local.VirtualPrivateCloud) != 0 ? module.AutoScalingGroup_WebServer.output[0].name : ""
  alarm_actions         = length(local.VirtualPrivateCloud) != 0 ? [for i in module.AutoScalingPolicy_WebServer.output : i.arn if i.name == "IncreaseGroupSize"] : []
  ok_actions            = length(local.VirtualPrivateCloud) != 0 ? [for i in module.AutoScalingPolicy_WebServer.output : i.arn if i.name == "DecreaseGroupSize"] : []
  CloudWatchMetricAlarm = length(local.VirtualPrivateCloud) != 0 ? [for i in local._checkCloudWatchMetricAlarm : i if i.tags[2] == "WebServer"] : []
}