variable "region" { type = string }
variable "profile" { type = string }
variable "availability_zones" { type = number }
variable "main_id" { type = string }

variable "VirtualPrivateCloud" {
  type = list(object({
    assign_generated_ipv6_cidr_block = bool
    cidr_block                       = string
    enable_dns_hostnames             = bool
    enable_dns_support               = bool
    instance_tenancy                 = string
    tags                             = list(string)
  }))
}

variable "InternetGateway" {
  type = list(object({
    tags = list(string)
  }))
}

variable "EgressOnlyInternetGateway" {
  type = list(object({
    tags = list(string)
  }))
}

variable "Subnet" {
  type = list(object({
    cidr_block                      = string
    map_public_ip_on_launch         = bool
    assign_ipv6_address_on_creation = bool
    ipv6_cidr_block                 = string
    tags                            = list(string)
  }))
}

variable "ElasticIP" {
  type = list(object({
    public_ipv4_pool = string
    vpc              = bool
    tags             = list(string)
  }))
}

variable "RouteTable_InternetGateway" {
  type = list(object({
    cidr_block      = string
    ipv6_cidr_block = string
    tags            = list(string)
  }))
}

variable "RouteTable_EgressOnlyInternetGateway" {
  type = list(object({
    ipv6_cidr_block = string
    tags            = list(string)
  }))
}

variable "NetworkAccessList" {
  type = list(object({
    tags = list(string)
  }))
}

variable "CidrBlocks" {
  type = object({
    ipv4 = object({
      all     = list(string)
      trusted = list(string)
    })
    ipv6 = object({
      all = list(string)
    })
  })
}

variable "NetworkAccessListRule" {
  type = object({
    ingress = object({
      allow = object({
        ssh       = list(any)
        http      = list(any)
        https     = list(any)
        ephemeral = list(any)
        all       = list(any)
      })
    })
    egress = object({
      allow = object({
        ssh       = list(any)
        http      = list(any)
        https     = list(any)
        ephemeral = list(any)
        all       = list(any)
      })
    })
  })
}

variable "SecurityGroup" {
  type = list(object({
    tags = list(string)
  }))
}

variable "SecurityGroupRule" {
  type = object({
    ingress = object({
      ssh   = list(any)
      http  = list(any)
      https = list(any)
      all   = list(any)
    })
    egress = object({
      http  = list(any)
      https = list(any)
      all   = list(any)
    })
  })
}

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

variable "TargetGroup" {
  type = list(object({
    target_type                   = string
    port                          = number
    protocol                      = string
    load_balancing_algorithm_type = string
    health_check = object({
      enabled             = bool
      interval            = number
      path                = string
      protocol            = string
      timeout             = number
      healthy_threshold   = number
      unhealthy_threshold = number
      matcher             = string
    })
    tags = list(string)
  }))
}

variable "AutoScalingGroup" {
  type = list(object({
    desired_capacity          = number
    max_size                  = number
    min_size                  = number
    health_check_grace_period = number
    health_check_type         = string
    tags                      = list(string)
  }))
}

variable "AutoScalingPolicy" {
  type = list(object({
    name               = string
    policy_type        = string
    adjustment_type    = string
    scaling_adjustment = number
    cooldown           = number
    tags               = list(string)
  }))
}

variable "CloudWatchMetricAlarm" {
  type = list(object({
    alarm_name          = string
    comparison_operator = string
    metric_name         = string
    statistic           = string
    namespace           = string
    period              = number
    evaluation_periods  = number
    threshold           = number
    tags                = list(string)
  }))
}

variable "LoadBalancer" {
  type = list(object({
    load_balancer_type = string
    internal           = bool
    ip_address_type    = string
    enable_http2       = bool
    tags               = list(string)
  }))
}

variable "LoadBalancerListener_http" {
  type = list(object({
    main_id             = string
    protocol            = string
    port                = string
    default_action_type = string
    redirect = object({
      protocol    = string
      port        = string
      host        = string
      path        = string
      query       = string
      status_code = string
    })
  }))
}

variable "LoadBalancerListener_https" {
  type = list(object({
    main_id             = string
    protocol            = string
    port                = string
    ssl_policy          = string
    default_action_type = string
  }))
}

variable "Route53" {
  type = list(object({
    name    = string
    main_id = string
    records = object({
      alias = list(object({
        name                   = string
        type                   = string
        evaluate_target_health = bool
      }))
    })
  }))
}