# Terraform Context

*TBD: automated tests*

The default convention is

{namespace}-{environment}-{name(s)}-{location}

we share data between components, not code.

Therefore this may seem a bit overkill in what it produces, but that is a small price to pay if that means not depending on code, but just asking for certain conditions to be met. This naturally has its downsides, like everything.
Modules will depend on the subset of information they need from this for their naming.
This is not as flexible as some other approaches, but a lot less invasive.

It will require to have smaller modules that do contained things, like expecting not to create global, regional or zonal resources in the same module. 
However that is usually not a good idea anyway.
Some things do not have a single solution and my aim here is to stay far away from becoming too much of a framework.

### example output

```hcl
context = {
  "delimiter" = tostring(null)
  "environment" = "bar"
  "location_abbreviations" = tomap({
    "us" = "us"
    "us-west-1" = "usw1"
  })
  "namespace" = "foo"
  "order" = tolist(null) /* of string */
}
format = {
  "global" = {
    "name1" = "foo-bar-%s"
    "name2" = "foo-bar-%s-%s"
    "name3" = "foo-bar-%s-%s-%s"
  }
  "us" = {
    "name1" = "foo-bar-%s-us"
    "name2" = "foo-bar-%s-%s-us"
    "name3" = "foo-bar-%s-%s-%s-us"
  }
  "us-west-1" = {
    "name1" = "foo-bar-%s-usw1"
    "name2" = "foo-bar-%s-%s-usw1"
    "name3" = "foo-bar-%s-%s-%s-usw1"
  }
}
```

<!-- BEGIN_TF_DOCS -->
## Requirements

The following requirements are needed by this module:

- <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) (>= 1.0.0)

## Providers

No providers.

## Modules

No modules.

## Resources

No resources.

## Required Inputs

The following input variables are required:

### <a name="input_context"></a> [context](#input\_context)

Description:     
context\_defaults = {  
  order                  = ["namespace", "environment", "name", "location"]  
  namespace              = null  
  environment            = null  
  location\_abbreviations = {}  
  delimiter              = "-"
}

Type:

```hcl
object({
    order                  = optional(list(string))
    namespace              = optional(string)
    environment            = optional(string)
    location_abbreviations = optional(map(string))
    delimiter              = optional(string)
  })
```

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_location_abbreviations"></a> [location\_abbreviations](#input\_location\_abbreviations)

Description: default values for location abbreviations

Type: `map(string)`

Default: `{}`

## Outputs

The following outputs are exported:

### <a name="output_context"></a> [context](#output\_context)

Description: n/a

### <a name="output_format"></a> [format](#output\_format)

Description: n/a
<!-- END_TF_DOCS -->