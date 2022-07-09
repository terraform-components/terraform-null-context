locals {
  context = {
    for k, v in var.context :
    k => v == null ? local.context_defaults[k] : v
  }

  namespace              = local.context.namespace
  environment            = local.context.environment
  delimiter              = local.context.delimiter
  location_abbreviations = local.context.location_abbreviations

  # this could probably all be more elegant. 
  # another time. 
  # for now it was most flexible to evaluate where to go as I am still developing this idea

  order1 = [for _, v in local.context.order : "{{${v}}}"]
  order2 = local.namespace != null ? local.order1 : [for _, v in local.order1 : v if v != "{{namespace}}"]
  order3 = local.environment != null ? local.order2 : [for _, v in local.order2 : v if v != "{{environment}}"]
  order  = local.order3

  format1 = merge({ "global" = join(local.delimiter, [for _, v in local.order : v if v != "{{location}}"]) }, {
    for k, v in local.location_abbreviations :
    k => replace(join(local.delimiter, local.order), "{{location}}", v)
  })

  format2 = {
    for k, v in local.format1 :
    k => replace(replace(
      v,
      "{{namespace}}", local.namespace != null ? local.namespace : ""),
    "{{environment}}", local.environment != null ? local.environment : "")
  }

  num_names = 3
  names     = [for k in range(local.num_names) : join(local.delimiter, [for v in range(k + 1) : "%s"])]

  format = merge(
    {
      for k, v in local.format2 :
      k => {
        for n in range(local.num_names) :
        "name${n + 1}" => replace(v, "{{name}}", local.names[n])
      }
    }
  )
}
