variable "Route53" {
  type = list(object({
    name          = string
    force_destroy = bool
    tags          = list(string)
    records = object({
      alias = list(object({
        name                   = string
        type                   = string
        evaluate_target_health = bool
      }))
    })
  }))
}
