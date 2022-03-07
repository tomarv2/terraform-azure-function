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
- Azure provider version [2.98.0](https://registry.terraform.io/providers/hashicorp/azurerm/latest)
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
#### Function Only

```
terraform {
  required_version = ">= 1.0.1"
  required_providers {
    azurerm = {
      version = "~> 2.98"
    }
  }
}

provider "azurerm" {
  features {}
}

module "function" {
  source                     = "../../"
  location                   = var.location
  resource_group_name        = var.resource_group_name
  storage_account_access_key = module.storage_account.storage_account_access_key
  storage_account_name       = module.storage_account.storage_account_name

  source_dir  = "sample-functions/function-helloworld-python"
  output_path = "/tmp/test.zip"
  #-----------------------------------------------
  # Note: Do not change teamid and prjid once set.
  teamid = var.teamid
  prjid  = var.prjid
}

module "storage_account" {
  source = "git::git@github.com:tomarv2/terraform-azure-storage-account.git//modules/account"

  resource_group_name = var.resource_group_name
  location            = var.location
  #-----------------------------------------------
  # Note: Do not change teamid and prjid once set.
  teamid = var.teamid
  prjid  = var.prjid
}

module "storage_container" {
  source = "git::git@github.com:tomarv2/terraform-azure-storage-account.git//modules/container"

  container_names      = [var.container_name]
  storage_account_name = module.storage_account.storage_account_name
  #-----------------------------------------------
  # Note: Do not change teamid and prjid once set.
  teamid = var.teamid
  prjid  = var.prjid
}

module "storage_blob" {
  source = "git::git@github.com:tomarv2/terraform-azure-storage-account.git//modules/blob"

  blob_name              = "example"
  blob_source            = "example.txt"
  storage_container_name = var.container_name
  storage_account_name   = module.storage_account.storage_account_name
}
```

Please refer to examples directory [link](examples) for references.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.1 |
| <a name="requirement_archive"></a> [archive](#requirement\_archive) | 2.2.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 2.98 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_archive"></a> [archive](#provider\_archive) | 2.2.0 |
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | ~> 2.98 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_app_service_plan.service_plan](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/app_service_plan) | resource |
| [azurerm_function_app.func_app](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/function_app) | resource |
| [archive_file.zip_dir](https://registry.terraform.io/providers/hashicorp/archive/2.2.0/docs/data-sources/file) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app_insights_connection_string"></a> [app\_insights\_connection\_string](#input\_app\_insights\_connection\_string) | Connection string of the existing Application Insights | `string` | `null` | no |
| <a name="input_app_insights_intrumentation_key"></a> [app\_insights\_intrumentation\_key](#input\_app\_insights\_intrumentation\_key) | Instrumentation key of the existing Application Insights | `string` | `null` | no |
| <a name="input_app_settings"></a> [app\_settings](#input\_app\_settings) | Application settings to insert on creating the function app. Following updates will be ignored, and has to be set manually. Updates done on application deploy or in portal will not affect terraform state file. | `map(any)` | `{}` | no |
| <a name="input_archive_type"></a> [archive\_type](#input\_archive\_type) | Archive type | `string` | `"zip"` | no |
| <a name="input_deploy_function"></a> [deploy\_function](#input\_deploy\_function) | Feature flag, true or false | `bool` | `true` | no |
| <a name="input_deploy_service_plan"></a> [deploy\_service\_plan](#input\_deploy\_service\_plan) | Feature flag, true or false | `bool` | `true` | no |
| <a name="input_enable_logging"></a> [enable\_logging](#input\_enable\_logging) | Function enable logging | `bool` | `true` | no |
| <a name="input_enabled"></a> [enabled](#input\_enabled) | Function enabled | `bool` | `true` | no |
| <a name="input_exclude_files"></a> [exclude\_files](#input\_exclude\_files) | File(s) to exclude in directory from zipping | `list(any)` | `null` | no |
| <a name="input_extra_tags"></a> [extra\_tags](#input\_extra\_tags) | Additional tags to associate | `map(string)` | `{}` | no |
| <a name="input_function_version"></a> [function\_version](#input\_function\_version) | Function version | `number` | `3` | no |
| <a name="input_https_only"></a> [https\_only](#input\_https\_only) | Function https only | `bool` | `false` | no |
| <a name="input_identity_ids"></a> [identity\_ids](#input\_identity\_ids) | UserAssigned Identities ID to add to Function App. Mandatory if type is UserAssigned | `list(string)` | `null` | no |
| <a name="input_identity_type"></a> [identity\_type](#input\_identity\_type) | MSI Identity type | `string` | `"SystemAssigned"` | no |
| <a name="input_location"></a> [location](#input\_location) | The location/region where the resource is created | `string` | `"westus2"` | no |
| <a name="input_name"></a> [name](#input\_name) | Function app name | `string` | `null` | no |
| <a name="input_os_type"></a> [os\_type](#input\_os\_type) | Operating System of the function | `string` | `"linux"` | no |
| <a name="input_output_path"></a> [output\_path](#input\_output\_path) | Output file path on local machine to deploy to lambda | `string` | n/a | yes |
| <a name="input_prjid"></a> [prjid](#input\_prjid) | Name of the project/stack e.g: mystack, nifieks, demoaci. Should not be changed after running 'tf apply' | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Name of the resource group | `string` | n/a | yes |
| <a name="input_service_plan_kind"></a> [service\_plan\_kind](#input\_service\_plan\_kind) | Service plan kind | `string` | `"FunctionApp"` | no |
| <a name="input_service_plan_name"></a> [service\_plan\_name](#input\_service\_plan\_name) | Service plan name | `string` | `null` | no |
| <a name="input_service_plan_reserved"></a> [service\_plan\_reserved](#input\_service\_plan\_reserved) | Service plan reserved, false for windows | `bool` | `true` | no |
| <a name="input_service_plan_size"></a> [service\_plan\_size](#input\_service\_plan\_size) | Service plan size | `string` | `"Y1"` | no |
| <a name="input_service_plan_tier"></a> [service\_plan\_tier](#input\_service\_plan\_tier) | For Consumption Plan | `string` | `"Dynamic"` | no |
| <a name="input_site_config"></a> [site\_config](#input\_site\_config) | Site config for App Service. See documentation https://www.terraform.io/docs/providers/azurerm/r/app_service.html#site_config. IP restriction attribute is not managed in this block. | `any` | `{}` | no |
| <a name="input_source_dir"></a> [source\_dir](#input\_source\_dir) | Input directory path on local machine to zip | `string` | n/a | yes |
| <a name="input_storage_account_access_key"></a> [storage\_account\_access\_key](#input\_storage\_account\_access\_key) | Storage account access key | `string` | n/a | yes |
| <a name="input_storage_account_name"></a> [storage\_account\_name](#input\_storage\_account\_name) | Storage account name | `string` | n/a | yes |
| <a name="input_teamid"></a> [teamid](#input\_teamid) | Name of the team/group e.g. devops, dataengineering. Should not be changed after running 'tf apply' | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_app_service_name"></a> [app\_service\_name](#output\_app\_service\_name) | Application service plan name |
| <a name="output_azurerm_function_app"></a> [azurerm\_function\_app](#output\_azurerm\_function\_app) | Application function name |
