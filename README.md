TBD: automated tests

The default convention is

{namespace}-{environment}-{name(s)}-{location}

attributes are however not handed in, as the output of is supposed to be used by others, not inected and depended on by others as code.

we share data between components, not code.

modules will depend on the subset of information they need from this for their naming.

this is not as flexible as some other approaches, but a lot less invasive.

It will require to have smaller modules that do contained things, like expecting not to create global, regional or zonal resources in the same module. 
However that is usually not a good idea anyway.
Some things do not have a single solution and my aim here is to stay far away from becoming too much of a framework.

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

No optional inputs.

## Outputs

The following outputs are exported:

### <a name="output_context"></a> [context](#output\_context)

Description: n/a

### <a name="output_format"></a> [format](#output\_format)

Description: n/a
<!-- END_TF_DOCS -->