# Customizing the lacework config for the collector

This example is a copy of the default one, with the additional option of passing
additional config down to the collector.

```hcl
module "lacework_ecs_datacollector" {
  source  = "lacework/ecs-agent/aws"
  version = "~> 0.1"

  ...

  lacework_config = jsonencode({
    codeaware = {
      enable = "all"
    }
  })
}
```
