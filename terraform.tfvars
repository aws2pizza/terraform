region             = "us-east-1" #"eu-central-1"
profile            = "2pizza-root-tf"
availability_zones = 2
main_id            = "01"

VirtualPrivateCloud = [
  {
    assign_generated_ipv6_cidr_block = true
    cidr_block                       = "192.168.0.0/16"
    enable_dns_hostnames             = true
    enable_dns_support               = true
    instance_tenancy                 = "default"
    tags                             = ["VirtualPrivateCloud", "01", "null", "null", "null"]
  }
]

InternetGateway = [
  {
    tags = ["InternetGateway", "01", "null", "null", "null", "null"]
  }
]

EgressOnlyInternetGateway = [
  {
    tags = ["EgressOnlyInternetGateway", "01", "null", "null", "null", "null"]
  }
]

Subnet = [
  {
    cidr_block                      = "192.168.11.0/24"
    map_public_ip_on_launch         = true
    assign_ipv6_address_on_creation = true
    ipv6_cidr_block                 = "2600:1f18:0915:af11::/64"
    tags                            = ["Subnet", "01", "JumpBox", "public", "a"]
  },
  {
    cidr_block                      = "192.168.21.0/24"
    map_public_ip_on_launch         = true
    assign_ipv6_address_on_creation = true
    ipv6_cidr_block                 = "2600:1f18:0915:af21::/64"
    tags                            = ["Subnet", "01", "ApplicationLoadBalancer", "public", "a"]
  },
  {
    cidr_block                      = "192.168.31.0/24"
    map_public_ip_on_launch         = true
    assign_ipv6_address_on_creation = true
    ipv6_cidr_block                 = "2600:1f18:0915:af31::/64"
    tags                            = ["Subnet", "01", "NatGateway", "public", "a"]
  },
  {
    cidr_block                      = "192.168.41.0/24"
    map_public_ip_on_launch         = false
    assign_ipv6_address_on_creation = true
    ipv6_cidr_block                 = "2600:1f18:0915:af41::/64"
    tags                            = ["Subnet", "01", "WebServer", "private", "a"]
  },
  {
    cidr_block                      = "192.168.51.0/24"
    map_public_ip_on_launch         = false
    assign_ipv6_address_on_creation = true
    ipv6_cidr_block                 = "2600:1f18:0915:af51::/64"
    tags                            = ["Subnet", "01", "Database", "private", "a"]
  },
  {
    cidr_block                      = "192.168.12.0/24"
    map_public_ip_on_launch         = true
    assign_ipv6_address_on_creation = true
    ipv6_cidr_block                 = "2600:1f18:0915:af12::/64"
    tags                            = ["Subnet", "01", "JumpBox", "public", "b"]
  },
  {
    cidr_block                      = "192.168.22.0/24"
    map_public_ip_on_launch         = true
    assign_ipv6_address_on_creation = true
    ipv6_cidr_block                 = "2600:1f18:0915:af22::/64"
    tags                            = ["Subnet", "01", "ApplicationLoadBalancer", "public", "b"]
  },
  {
    cidr_block                      = "192.168.32.0/24"
    map_public_ip_on_launch         = true
    assign_ipv6_address_on_creation = true
    ipv6_cidr_block                 = "2600:1f18:0915:af32::/64"
    tags                            = ["Subnet", "01", "NatGateway", "public", "b"]
  },
  {
    cidr_block                      = "192.168.42.0/24"
    map_public_ip_on_launch         = false
    assign_ipv6_address_on_creation = true
    ipv6_cidr_block                 = "2600:1f18:0915:af42::/64"
    tags                            = ["Subnet", "01", "WebServer", "private", "b"]
  },
  {
    cidr_block                      = "192.168.52.0/24"
    map_public_ip_on_launch         = false
    assign_ipv6_address_on_creation = true
    ipv6_cidr_block                 = "2600:1f18:0915:af52::/64"
    tags                            = ["Subnet", "01", "Database", "private", "b"]
  },
  {
    cidr_block                      = "192.168.13.0/24"
    map_public_ip_on_launch         = true
    assign_ipv6_address_on_creation = true
    ipv6_cidr_block                 = "2600:1f18:0915:af13::/64"
    tags                            = ["Subnet", "01", "JumpBox", "public", "c"]
  },
  {
    cidr_block                      = "192.168.23.0/24"
    map_public_ip_on_launch         = true
    assign_ipv6_address_on_creation = true
    ipv6_cidr_block                 = "2600:1f18:0915:af23::/64"
    tags                            = ["Subnet", "01", "ApplicationLoadBalancer", "public", "c"]
  },
  {
    cidr_block                      = "192.168.33.0/24"
    map_public_ip_on_launch         = true
    assign_ipv6_address_on_creation = true
    ipv6_cidr_block                 = "2600:1f18:0915:af33::/64"
    tags                            = ["Subnet", "01", "NatGateway", "public", "c"]
  },
  {
    cidr_block                      = "192.168.43.0/24"
    map_public_ip_on_launch         = false
    assign_ipv6_address_on_creation = true
    ipv6_cidr_block                 = "2600:1f18:0915:af43::/64"
    tags                            = ["Subnet", "01", "WebServer", "private", "c"]
  },
  {
    cidr_block                      = "192.168.53.0/24"
    map_public_ip_on_launch         = false
    assign_ipv6_address_on_creation = true
    ipv6_cidr_block                 = "2600:1f18:0915:af53::/64"
    tags                            = ["Subnet", "01", "Database", "private", "c"]
  },
  {
    cidr_block                      = "192.168.14.0/24"
    map_public_ip_on_launch         = true
    assign_ipv6_address_on_creation = true
    ipv6_cidr_block                 = "2600:1f18:0915:af14::/64"
    tags                            = ["Subnet", "01", "JumpBox", "public", "d"]
  },
  {
    cidr_block                      = "192.168.24.0/24"
    map_public_ip_on_launch         = true
    assign_ipv6_address_on_creation = true
    ipv6_cidr_block                 = "2600:1f18:0915:af24::/64"
    tags                            = ["Subnet", "01", "ApplicationLoadBalancer", "public", "d"]
  },
  {
    cidr_block                      = "192.168.34.0/24"
    map_public_ip_on_launch         = true
    assign_ipv6_address_on_creation = true
    ipv6_cidr_block                 = "2600:1f18:0915:af34::/64"
    tags                            = ["Subnet", "01", "NatGateway", "public", "d"]
  },
  {
    cidr_block                      = "192.168.44.0/24"
    map_public_ip_on_launch         = false
    assign_ipv6_address_on_creation = true
    ipv6_cidr_block                 = "2600:1f18:0915:af44::/64"
    tags                            = ["Subnet", "01", "WebServer", "private", "d"]
  },
  {
    cidr_block                      = "192.168.54.0/24"
    map_public_ip_on_launch         = false
    assign_ipv6_address_on_creation = true
    ipv6_cidr_block                 = "2600:1f18:0915:af54::/64"
    tags                            = ["Subnet", "01", "Database", "private", "d"]
  },
  {
    cidr_block                      = "192.168.15.0/24"
    map_public_ip_on_launch         = true
    assign_ipv6_address_on_creation = true
    ipv6_cidr_block                 = "2600:1f18:0915:af15::/64"
    tags                            = ["Subnet", "01", "JumpBox", "public", "e"]
  },
  {
    cidr_block                      = "192.168.25.0/24"
    map_public_ip_on_launch         = true
    assign_ipv6_address_on_creation = true
    ipv6_cidr_block                 = "2600:1f18:0915:af25::/64"
    tags                            = ["Subnet", "01", "ApplicationLoadBalancer", "public", "e"]
  },
  {
    cidr_block                      = "192.168.35.0/24"
    map_public_ip_on_launch         = true
    assign_ipv6_address_on_creation = true
    ipv6_cidr_block                 = "2600:1f18:0915:af35::/64"
    tags                            = ["Subnet", "01", "NatGateway", "public", "e"]
  },
  {
    cidr_block                      = "192.168.45.0/24"
    map_public_ip_on_launch         = false
    assign_ipv6_address_on_creation = true
    ipv6_cidr_block                 = "2600:1f18:0915:af45::/64"
    tags                            = ["Subnet", "01", "WebServer", "private", "e"]
  },
  {
    cidr_block                      = "192.168.55.0/24"
    map_public_ip_on_launch         = false
    assign_ipv6_address_on_creation = true
    ipv6_cidr_block                 = "2600:1f18:0915:af55::/64"
    tags                            = ["Subnet", "01", "Database", "private", "e"]
  },
  {
    cidr_block                      = "192.168.16.0/24"
    map_public_ip_on_launch         = true
    assign_ipv6_address_on_creation = true
    ipv6_cidr_block                 = "2600:1f18:0915:af16::/64"
    tags                            = ["Subnet", "01", "JumpBox", "public", "f"]
  },
  {
    cidr_block                      = "192.168.26.0/24"
    map_public_ip_on_launch         = true
    assign_ipv6_address_on_creation = true
    ipv6_cidr_block                 = "2600:1f18:0915:af26::/64"
    tags                            = ["Subnet", "01", "ApplicationLoadBalancer", "public", "f"]
  },
  {
    cidr_block                      = "192.168.36.0/24"
    map_public_ip_on_launch         = true
    assign_ipv6_address_on_creation = true
    ipv6_cidr_block                 = "2600:1f18:0915:af36::/64"
    tags                            = ["Subnet", "01", "NatGateway", "public", "f"]
  },
  {
    cidr_block                      = "192.168.46.0/24"
    map_public_ip_on_launch         = false
    assign_ipv6_address_on_creation = true
    ipv6_cidr_block                 = "2600:1f18:0915:af46::/64"
    tags                            = ["Subnet", "01", "WebServer", "private", "f"]
  },
  {
    cidr_block                      = "192.168.56.0/24"
    map_public_ip_on_launch         = false
    assign_ipv6_address_on_creation = true
    ipv6_cidr_block                 = "2600:1f18:0915:af56::/64"
    tags                            = ["Subnet", "01", "Database", "private", "f"]
  },
]

ElasticIP = [
  {
    public_ipv4_pool = "amazon"
    vpc              = true
    tags             = ["ElasticIP", "01", "NatGateway", "null", "a"]
  },
  {
    public_ipv4_pool = "amazon"
    vpc              = true
    tags             = ["ElasticIP", "01", "NatGateway", "null", "b"]
  },
  {
    public_ipv4_pool = "amazon"
    vpc              = true
    tags             = ["ElasticIP", "01", "NatGateway", "null", "c"]
  },
  {
    public_ipv4_pool = "amazon"
    vpc              = true
    tags             = ["ElasticIP", "01", "NatGateway", "null", "d"]
  },
  {
    public_ipv4_pool = "amazon"
    vpc              = true
    tags             = ["ElasticIP", "01", "NatGateway", "null", "e"]
  },
  {
    public_ipv4_pool = "amazon"
    vpc              = true
    tags             = ["ElasticIP", "01", "NatGateway", "null", "f"]
  }
]

RouteTable_InternetGateway = [
  {
    cidr_block      = "0.0.0.0/0"
    ipv6_cidr_block = "::/0"
    tags            = ["RouteTable", "01", "InternetGateway", "null", "null"]
  }
]

RouteTable_EgressOnlyInternetGateway = [
  {
    ipv6_cidr_block = "::/0"
    tags            = ["RouteTable", "01", "EgressOnlyInternetGateway", "null", "null"]
  }
]

NetworkAccessList = [
  {
    tags = ["NetworkAccessList", "01", "JumpBox", "null", "null"]
  },
  {
    tags = ["NetworkAccessList", "01", "ApplicationLoadBalancer", "null", "null"]
  },
  {
    tags = ["NetworkAccessList", "01", "NatGateway", "null", "null"]
  },
  {
    tags = ["NetworkAccessList", "01", "WebServer", "null", "null"]
  },
  {
    tags = ["NetworkAccessList", "01", "Database", "null", "null"]
  }
]

CidrBlocks = {
  ipv4 = {
    all = [
      "0.0.0.0/0"
    ]
    trusted = [
      "37.213.225.28/32",
      "178.120.246.113/32",
      "178.120.236.87/32",
      "178.120.218.127/32",
      "37.214.250.216/32",
      "213.184.248.27/32"
    ]
  }
  ipv6 = {
    all = [
      "::/0"
    ]
  }
}

NetworkAccessListRule = {
  ingress = {
    allow = {
      ssh       = [100, false, "tcp", "allow", 22, 22]
      http      = [200, false, "tcp", "allow", 80, 80]
      https     = [300, false, "tcp", "allow", 443, 443]
      ephemeral = [800, false, "tcp", "allow", 1024, 65535]
      all       = [900, false, "-1", "allow", 0, 0]
    }
  }
  egress = {
    allow = {
      ssh       = [100, true, "tcp", "allow", 22, 22]
      http      = [200, true, "tcp", "allow", 80, 80]
      https     = [300, true, "tcp", "allow", 443, 443]
      ephemeral = [800, true, "tcp", "allow", 1024, 65535]
      all       = [900, true, "-1", "allow", 0, 0]
    }
  }
}

SecurityGroup = [
  {
    tags = ["SecurityGroup", "01", "JumpBox", "null", "null"]
  },
  {
    tags = ["SecurityGroup", "01", "ApplicationLoadBalancer", "null", "null"]
  },
  {
    tags = ["SecurityGroup", "01", "NatGateway", "null", "null"]
  },
  {
    tags = ["SecurityGroup", "01", "WebServer", "null", "null"]
  },
  {
    tags = ["SecurityGroup", "01", "Database", "null", "null"]
  }
]

SecurityGroupRule = {
  ingress = {
    ssh   = ["ingress", "tcp", 22, 22]
    http  = ["ingress", "tcp", 80, 80]
    https = ["ingress", "tcp", 443, 443]
    all   = ["ingress", "-1", 0, 0]
  }
  egress = {
    http  = ["egress", "tcp", 80, 80]
    https = ["egress", "tcp", 443, 443]
    all   = ["egress", "-1", 0, 0]
  }
}


LaunchTemplate = [
  {
    tags = ["LaunchTemplate", "01", "JumpBox", "null", "null"]
    block_device_mappings = {
      device_name = "/dev/xvda"
      ebs = {
        volume_type           = "gp2"
        volume_size           = "10"
        delete_on_termination = true
        encrypted             = true
      }
    }
    key_name                             = "north_virginia"
    instance_initiated_shutdown_behavior = "terminate"
    instance_type                        = "t2.micro"
  },
  {
    tags = ["LaunchTemplate", "01", "WebServer", "null", "null"]
    block_device_mappings = {
      device_name = "/dev/xvda"
      ebs = {
        volume_type           = "gp2"
        volume_size           = "10"
        delete_on_termination = true
        encrypted             = true
      }
    }
    key_name                             = "north_virginia"
    instance_initiated_shutdown_behavior = "terminate"
    instance_type                        = "t2.micro"
  }
]

TargetGroup = [
  {
    target_type                   = "instance"
    port                          = 80
    protocol                      = "HTTP"
    load_balancing_algorithm_type = "round_robin"
    health_check = {
      enabled             = true
      interval            = 30
      path                = "/"
      protocol            = "HTTP"
      timeout             = 5
      healthy_threshold   = 2
      unhealthy_threshold = 2
      matcher             = "200"
    }
    tags = ["TargetGroup", "01", "WebServer", "null", "null"]
  }
]

AutoScalingGroup = [
  {
    desired_capacity          = 1
    max_size                  = 2
    min_size                  = 1
    health_check_grace_period = 300
    health_check_type         = "EC2"
    tags                      = ["AutoScalingGroup", "01", "JumpBox", "null", "null"]
  },
  {
    desired_capacity          = 1
    max_size                  = 1
    min_size                  = 1
    health_check_grace_period = 300
    health_check_type         = "EC2"
    tags                      = ["AutoScalingGroup", "01", "WebServer", "null", "null"]
  }
]

AutoScalingPolicy = [
  {
    name               = "IncreaseGroupSize"
    policy_type        = "SimpleScaling"
    adjustment_type    = "ChangeInCapacity"
    scaling_adjustment = 1
    cooldown           = 300
    tags               = ["AutoScalingPolicy", "01", "JumpBox", "null", "null"]
  },
  {
    name               = "DecreaseGroupSize"
    policy_type        = "SimpleScaling"
    adjustment_type    = "ChangeInCapacity"
    scaling_adjustment = -1
    cooldown           = 300
    tags               = ["AutoScalingPolicy", "01", "JumpBox", "null", "null"]
  },
  {
    name               = "IncreaseGroupSize"
    policy_type        = "SimpleScaling"
    adjustment_type    = "ChangeInCapacity"
    scaling_adjustment = 1
    cooldown           = 300
    tags               = ["AutoScalingPolicy", "01", "WebServer", "null", "null"]
  },
  {
    name               = "DecreaseGroupSize"
    policy_type        = "SimpleScaling"
    adjustment_type    = "ChangeInCapacity"
    scaling_adjustment = -1
    cooldown           = 300
    tags               = ["AutoScalingPolicy", "01", "WebServer", "null", "null"]
  }
]

CloudWatchMetricAlarm = [
  {
    alarm_name          = "CPU"
    comparison_operator = "GreaterThanThreshold"
    metric_name         = "CPUUtilization"
    statistic           = "Average"
    namespace           = "AWS/EC2"
    period              = 300
    evaluation_periods  = 1
    threshold           = 70
    tags                = ["CloudWatchMetricAlarm", "01", "JumpBox", "null", "null"]
  },
  {
    alarm_name          = "CPU"
    comparison_operator = "GreaterThanThreshold"
    metric_name         = "CPUUtilization"
    statistic           = "Average"
    namespace           = "AWS/EC2"
    period              = 300
    evaluation_periods  = 1
    threshold           = 30
    tags                = ["CloudWatchMetricAlarm", "01", "WebServer", "null", "null"]
  }
]

LoadBalancer = [
  {
    load_balancer_type = "application"
    internal           = false
    ip_address_type    = "ipv4"
    enable_http2       = true
    tags               = ["ApplicationLoadBalancer", "01", "null", "null", "null"]
  }
]

LoadBalancerListener_http = [
  {
    main_id             = "01"
    protocol            = "HTTP"
    port                = "80"
    default_action_type = "redirect"
    redirect = {
      protocol    = "HTTPS"
      port        = "443"
      host        = "#{host}"
      path        = "/#{path}"
      query       = "#{query}"
      status_code = "HTTP_301"
    }
  }
]

LoadBalancerListener_https = [
  {
    main_id             = "01"
    protocol            = "HTTPS"
    port                = "443"
    ssl_policy          = "ELBSecurityPolicy-2016-08"
    default_action_type = "forward"
  }
]

Route53 = [
  {
    name    = "2pizza.name"
    main_id = "01"
    records = {
      alias = [
        {
          name                   = ""
          type                   = "A"
          evaluate_target_health = true
        },
        {
          name                   = "www"
          type                   = "A"
          evaluate_target_health = true
        }
      ]
    }
  }
]