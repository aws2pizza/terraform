#output "VirtualPrivateCloud" { value = module.VirtualPrivateCloud.output }

#output "InternetGateway" { value = module.InternetGateway.output.*.tags.Name }

#output "EgressOnlyInternetGateway" { value = module.EgressOnlyInternetGateway.output.*.tags.Name }

#output "Subnet_A" { value = module.Subnet_A.output.*.tags.Name }
#output "Subnet_B" { value = module.Subnet_B.output.*.tags.Name }
#output "Subnet_C" { value = module.Subnet_C.output.*.tags.Name }
#output "Subnet_D" { value = module.Subnet_D.output.*.tags.Name }
#output "Subnet_E" { value = module.Subnet_E.output.*.tags.Name }
#output "Subnet_F" { value = module.Subnet_F.output.*.tags.Name }

#output "ElasticIP_NatGateway_A" { value = module.ElasticIP_NatGateway_A.output.*.tags.Name }
#output "ElasticIP_NatGateway_B" { value = module.ElasticIP_NatGateway_B.output.*.tags.Name }
#output "ElasticIP_NatGateway_C" { value = module.ElasticIP_NatGateway_C.output.*.tags.Name }
#output "ElasticIP_NatGateway_D" { value = module.ElasticIP_NatGateway_D.output.*.tags.Name }
#output "ElasticIP_NatGateway_E" { value = module.ElasticIP_NatGateway_E.output.*.tags.Name }
#output "ElasticIP_NatGateway_F" { value = module.ElasticIP_NatGateway_F.output.*.tags.Name }

#output "NatGateway_A" { value = module.NatGateway_A.output.*.tags.Name }
#output "NatGateway_B" { value = module.NatGateway_B.output.*.tags.Name }
#output "NatGateway_C" { value = module.NatGateway_C.output.*.tags.Name }
#output "NatGateway_D" { value = module.NatGateway_D.output.*.tags.Name }
#output "NatGateway_E" { value = module.NatGateway_E.output.*.tags.Name }
#output "NatGateway_F" { value = module.NatGateway_F.output.*.tags.Name }

#output "RouteTable_InternetGateway" { value = module.RouteTable_InternetGateway.output.*.tags.Name }

#output "RouteTable_EgressOnlyInternetGateway" { value = module.RouteTable_EgressOnlyInternetGateway.output.*.tags.Name }

#output "RouteTable_NatGateway_A" { value = module.RouteTable_NatGateway_A.output.*.tags.Name }
#output "RouteTable_NatGateway_B" { value = module.RouteTable_NatGateway_B.output.*.tags.Name }
#output "RouteTable_NatGateway_C" { value = module.RouteTable_NatGateway_C.output.*.tags.Name }
#output "RouteTable_NatGateway_D" { value = module.RouteTable_NatGateway_D.output.*.tags.Name }
#output "RouteTable_NatGateway_E" { value = module.RouteTable_NatGateway_E.output.*.tags.Name }
#output "RouteTable_NatGateway_F" { value = module.RouteTable_NatGateway_F.output.*.tags.Name }

#output "NetworkAccessList_A_common" { value = module.NetworkAccessList_A_common.output.*.tags.Name }
#output "NetworkAccessList_B_common" { value = module.NetworkAccessList_B_common.output.*.tags.Name }
#output "NetworkAccessList_C_common" { value = module.NetworkAccessList_C_common.output.*.tags.Name }
#output "NetworkAccessList_D_common" { value = module.NetworkAccessList_D_common.output.*.tags.Name }
#output "NetworkAccessList_E_common" { value = module.NetworkAccessList_E_common.output.*.tags.Name }
#output "NetworkAccessList_F_common" { value = module.NetworkAccessList_F_common.output.*.tags.Name }

#output "LaunchTemplate_JumpBox" { value = module.LaunchTemplate_JumpBox.output }
#output "AutoscalingPolicy_JumpBox" { value = module.AutoScalingPolicy_JumpBox.output }

#output "RouteTable_NatGatewayAll" { value = local.RouteTable_NatGatewayAll }