#########################################################
# MODULE: LaunchTemplate
#########################################################
locals {
  _checkLaunchTemplate = length([for i in var.LaunchTemplate : i if i.tags[1] == var.main_id]) != 0 ? [for i in var.LaunchTemplate : i if i.tags[1] == var.main_id] : []
}

module "LaunchTemplate_JumpBox" {
  source                 = "./modules/LaunchTemplate"
  image_id               = length(local.VirtualPrivateCloud) != 0 ? data.aws_ami.MachineImage.id : ""
  vpc_security_group_ids = length(local.VirtualPrivateCloud) != 0 ? [[for i in module.SecurityGroup.output : i.id if i.tags._tag02_union == "JumpBox"][0]] : []
  user_data              = length(local.VirtualPrivateCloud) != 0 ? filebase64("./modules/LaunchTemplate/JumpBox/bootstrap.sh") : ""
  LaunchTemplate         = length(local.VirtualPrivateCloud) != 0 ? [for i in local._checkLaunchTemplate : i if i.tags[2] == "JumpBox"] : []
}
module "LaunchTemplate_WebServer" {
  source                 = "./modules/LaunchTemplate"
  image_id               = length(local.VirtualPrivateCloud) != 0 ? data.aws_ami.MachineImage.id : ""
  vpc_security_group_ids = length(local.VirtualPrivateCloud) != 0 ? [[for i in module.SecurityGroup.output : i.id if i.tags._tag02_union == "WebServer"][0]] : []
  user_data              = length(local.VirtualPrivateCloud) != 0 ? filebase64("./modules/LaunchTemplate/WebServer/bootstrap.sh") : ""
  LaunchTemplate         = length(local.VirtualPrivateCloud) != 0 ? [for i in local._checkLaunchTemplate : i if i.tags[2] == "WebServer"] : []
}
