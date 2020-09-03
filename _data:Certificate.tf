#########################################################
# DATA: Certificate
#########################################################
data "aws_acm_certificate" "Certificate01" {
  domain   = format("*.%s", var.Route53[0].name)
  statuses = ["ISSUED"]
  types    = ["AMAZON_ISSUED"]
}
