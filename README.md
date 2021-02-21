# Terraform module for Function

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12 |
| azurerm | ~> 2.21 |

## Providers

| Name | Version |
|------|---------|
| azurerm | ~> 2.21 |

## Pre-reqs:

Set below environment variables:

```
export TF_VAR_subscription_id=<sub_id>
export TF_VAR_client_id=<client_id>
export TF_VAR_client_secret=<client_secret>
export TF_VAR_tenant_id=<tenant_id>
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| appinsight\_retention | false for windows | `bool` | `true` | no |
| appinsight\_type | n/a | `string` | `"other"` | no |
| email | n/a | `any` | n/a | yes |
| function\_enable\_logging | n/a | `bool` | `true` | no |
| function\_enabled | n/a | `bool` | `true` | no |
| function\_extension\_version | n/a | `string` | `"~3"` | no |
| function\_https\_only | n/a | `bool` | `false` | no |
| function\_os\_type | n/a | `string` | `"linux"` | no |
| function\_version | n/a | `string` | `"~3"` | no |
| function\_worker\_runtime | n/a | `string` | `"python"` | no |
| identity\_type | n/a | `string` | `"SystemAssigned"` | no |
| linux\_fx\_version | DOCKER\|docker\_image:docker\_image\_tag | `string` | `"PYTHON|3.8"` | no |
| prjid | Name of the project/stack.  EG: mystack | `any` | n/a | yes |
| python\_dont\_write\_byte\_code | n/a | `number` | `1` | no |
| rg\_name | Resource Group name | `any` | n/a | yes |
| rg\_region | region | `string` | `"centralus"` | no |
| service\_plan\_kind | for Consumption Plan | `string` | `"FunctionApp"` | no |
| service\_plan\_reserved | false for windows | `bool` | `true` | no |
| service\_plan\_size | n/a | `string` | `"Y1"` | no |
| service\_plan\_tier | for Consumption Plan | `string` | `"Dynamic"` | no |
| site\_config\_always\_on | n/a | `bool` | `false` | no |
| stg\_account | n/a | `any` | n/a | yes |
| stg\_account\_key | n/a | `any` | n/a | yes |
| stg\_connection | n/a | `bool` | `true` | no |
| stg\_connection\_string\_for\_sas | n/a | `any` | n/a | yes |
| teamid | Name of the team or group e.g. devops, dataengineering. Should not be changed after running 'tf apply'. | `any` | n/a | yes |
| use\_32\_bit\_worker\_process | n/a | `bool` | `false` | no |
| website\_run\_from\_package | n/a | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| app\_id | n/a |
| app\_service\_name | n/a |
| azurerm\_function\_app | n/a |
| sas\_url\_query\_string | n/a |
