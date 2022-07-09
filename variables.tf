
locals {
  # this can be improved in terraform 1.3.0, see https://github.com/hashicorp/terraform/releases/tag/v1.3.0-alpha20220706
  context_defaults = {
    order                  = ["namespace", "environment", "name", "location"]
    namespace              = null
    environment            = null
    location_abbreviations = var.location_abbreviations
    delimiter              = "-"
  }
}

variable "location_abbreviations" {
  type        = map(string)
  description = "default values for location abbreviations"
  default     = {}
}

variable "context" {
  type = object({
    order                  = optional(list(string))
    namespace              = optional(string)
    environment            = optional(string)
    location_abbreviations = optional(map(string))
    delimiter              = optional(string)
  })
  description = <<-EOT
    
    context_defaults = {
      order                  = ["namespace", "environment", "name", "location"]
      namespace              = null
      environment            = null
      location_abbreviations = {}
      delimiter              = "-"
    }

    EOT
}
