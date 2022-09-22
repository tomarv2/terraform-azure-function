<p align="center">
    <a href="https://github.com/tomarv2/terraform-azure-functions/actions/workflows/pre-commit.yml" alt="Pre Commit">
        <img src="https://github.com/tomarv2/terraform-azure-functions/actions/workflows/pre-commit.yml/badge.svg?branch=main" /></a>
    <a href="https://www.apache.org/licenses/LICENSE-2.0" alt="license">
        <img src="https://img.shields.io/github/license/tomarv2/terraform-azure-functions" /></a>
    <a href="https://github.com/tomarv2/terraform-azure-functions/tags" alt="GitHub tag">
        <img src="https://img.shields.io/github/v/tag/tomarv2/terraform-azure-functions" /></a>
    <a href="https://github.com/tomarv2/terraform-azure-functions/pulse" alt="Activity">
        <img src="https://img.shields.io/github/commit-activity/m/tomarv2/terraform-azure-functions" /></a>
    <a href="https://stackoverflow.com/users/6679867/tomarv2" alt="Stack Exchange reputation">
        <img src="https://img.shields.io/stackexchange/stackoverflow/r/6679867"></a>
    <a href="https://twitter.com/intent/follow?screen_name=varuntomar2019" alt="follow on Twitter">
        <img src="https://img.shields.io/twitter/follow/varuntomar2019?style=social&logo=twitter"></a>
</p>

## Terraform module for [Azure Functions](https://registry.terraform.io/modules/tomarv2/functions/azure/latest)

> :arrow_right:  Terraform module for [AWS Lambda](https://registry.terraform.io/modules/tomarv2/lambda/aws/latest)

> :arrow_right:  Terraform module for [Google CloudFunction](https://registry.terraform.io/modules/tomarv2/cloudfunction/google/latest)


### Versions

- Module tested for Terraform 1.0.1.
- Azure provider version [3.21.1](https://registry.terraform.io/providers/hashicorp/azurerm/latest)
- `main` branch: Provider versions not pinned to keep up with Terraform releases
- `tags` releases: Tags are pinned with versions (use <a href="https://github.com/tomarv2/terraform-azure-functions/tags" alt="GitHub tag">
        <img src="https://img.shields.io/github/v/tag/tomarv2/terraform-azure-functions" /></a> in your releases)

### Usage

#### Option 1:

```
terrafrom init
terraform plan -var='teamid=tryme' -var='prjid=project'
terraform apply -var='teamid=tryme' -var='prjid=project'
terraform destroy -var='teamid=tryme' -var='prjid=project'
```
**Note:** With this option please take care of remote state storage

#### Option 2:

#### Recommended method (stores remote state in storage using `prjid` and `teamid` to create directory structure):

- Create python 3.8+ virtual environment
```
python3 -m venv <venv name>
```

- Install package:
```
pip install tfremote --upgrade
```

- Set below environment variables:
```
export TF_AZURE_STORAGE_ACCOUNT=tfstatexxxxx # Output of remote_state.sh
export TF_AZURE_CONTAINER=tfstate # Output of remote_state.sh
export ARM_ACCESS_KEY=xxxxxxxxxx # Output of remote_state.sh
```

- Updated `examples` directory to required values

- Run and verify the output before deploying:
```
tf -c=azure plan -var='teamid=foo' -var='prjid=bar'
```

- Run below to deploy:
```
tf -c=azure apply -var='teamid=foo' -var='prjid=bar'
```

- Run below to destroy:
```
tf -c=azure destroy -var='teamid=foo' -var='prjid=bar'
```
**Note:** Read more on [tfremote](https://github.com/tomarv2/tfremote)
#### Function

```
terraform {
  required_version = ">= 1.0.1"
  required_providers {
    azurerm = {
      version = "~> 3.21.1"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_service_plan" "service_plan" {
  name                = "<service_plan_name>"
  location            = var.location
  resource_group_name = "<resource group name>"
  os_type             = "Linux"
  sku_name            = "P1v2"
}


module "function" {
  source = "../../"
  function_apps_config = {
    "<function_name>" = {
      location                   = var.location
      resource_group             = "<resource group name>"
      storage_account_access_key = "<storage_access_key>"
      storage_account_name       = "<storage_name>"
      service_plan_id            = azurerm_service_plan.service_plan.id
      app_settings = {
        app_insights_instrumentation_key = "<instrumentation_key>"
        app_insights_connection_string  = "<connection_string>"
      }
    }
  }
  #-----------------------------------------------
  # Note: Do not change teamid and prjid once set.
  teamid = var.teamid
  prjid  = var.prjid
}

```

Please refer to examples directory [link](examples) for references.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.1 |
| <a name="requirement_archive"></a> [archive](#requirement\_archive) | 2.2.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 3.21.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | ~> 3.21.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_linux_function_app.func_app](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_function_app) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_extra_tags"></a> [extra\_tags](#input\_extra\_tags) | Additional tags to associate | `map(string)` | `{}` | no |
| <a name="input_function_apps_config"></a> [function\_apps\_config](#input\_function\_apps\_config) | n/a | `any` | n/a | yes |
| <a name="input_identity_ids"></a> [identity\_ids](#input\_identity\_ids) | Specifies a list of user managed identity ids to be assigned. Required if type is UserAssigned. | `list(string)` | `null` | no |
| <a name="input_identity_type"></a> [identity\_type](#input\_identity\_type) | Specifies the identity type of the Function App. Possible values are SystemAssigned (where Azure will generate a Service Principal for you), UserAssigned where you can specify the Service Principal IDs in the identity\_ids field, and SystemAssigned, UserAssigned which assigns both a system managed identity as well as the specified user assigned identities. | `string` | `"SystemAssigned"` | no |
| <a name="input_prjid"></a> [prjid](#input\_prjid) | Name of the project/stack e.g: mystack, nifieks, demoaci. Should not be changed after running 'tf apply' | `string` | n/a | yes |
| <a name="input_service_plan_id"></a> [service\_plan\_id](#input\_service\_plan\_id) | The ID of the App Service Plan within which to create this Function App. | `any` | `null` | no |
| <a name="input_site_config"></a> [site\_config](#input\_site\_config) | Site config for App Service. See documentation https://www.terraform.io/docs/providers/azurerm/r/app_service.html#site_config. IP restriction attribute is not managed in this block. | `any` | `{}` | no |
| <a name="input_teamid"></a> [teamid](#input\_teamid) | Name of the team/group e.g. devops, dataengineering. Should not be changed after running 'tf apply' | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_name"></a> [name](#output\_name) | Application function name |
<!-- END_TF_DOCS -->
