[![](https://img.shields.io/badge/license-Apache%202-blue.svg)](https://www.apache.org/licenses/LICENSE-2.0)
# Terraform module for Function
Terraform to creates Functions

## Versions

- Module tested for Terraform 0.14.
- Azure provider version [2.48.0](https://registry.terraform.io/providers/hashicorp/azurerm/latest)
- `main` branch: Provider versions not pinned to keep up with Terraform releases
- `tags` releases: Tags are pinned with versions (use latest tag in your releases)

**NOTE:** 

- Read more on [tfremote](https://github.com/tomarv2/tfremote)

## Usage

Recommended method:

- Create python 3.6+ virtual environment 
```
python3 -m venv <venv name>
```

- Install package:
```
pip install tfremote
```

- Set below environment variables:
```
export TF_AZURE_STORAGE_ACCOUNT=tfstatexxxxx # Output of remote_state.sh
export TF_AZURE_CONTAINER=tfstate # Output of remote_state.sh
export ARM_ACCESS_KEY=xxxxxxxxxx # Output of remote_state.sh
```  

- Update:
```
example/custom/sample.tfvars
```

- Change to: 
```
example/base
``` 

- Run and verify the output before deploying:
```
tf -cloud aws plan -var-file <path to .tfvars file>
```

- Run below to deploy:
```
tf -cloud aws apply -var-file <path to .tfvars file>
```

- Run below to destroy:
```
tf -cloud aws destroy -var-file <path to .tfvars file>
```

Please refer to example directory [link](example/README.md) for references.

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
