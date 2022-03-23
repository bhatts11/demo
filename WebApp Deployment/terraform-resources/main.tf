# backend storageaccount declaration to store the terraform state file. This should exist already.
terraform {
  backend "azurerm" {
    #   subscription_id       = "da74xxxx-9c9a-xxxx-8fae-xxxxxxxxxxxx"
    subscription_id      = "aa01771c-5ab3-4809-b7e6-30c8080fc4ee"
    resource_group_name  = "rg-vantage-ehc"
    storage_account_name = "terraformvantagedit1" # Storage account used for backend
    container_name       = "terraformstate"
    key                  = "terraform.tfstate" # Terraform State file
  }
}
# Azurerm providers declaration
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.42.0"
    }
  }
  #required_version = ">= 0.13"
}
provider "azurerm" {
  alias                      = "vantageehc"
  subscription_id            = var.subscription_id
  skip_provider_registration = true
  features {}
}

provider "azurerm" {
  features {}
  skip_provider_registration = true
}

### Data source for KV - to retrive the secrets from KV, declaring the existing KV details.

## To get object & tenant ID , declaring the data source. 
data "azurerm_client_config" "current" {}

#############################################################################

############# 1. VNET & SUBNET Deployment Code #############

# module "vnet01" {
#   source             = "../terraform-modules/network"
#   vnet_Name          = var.vnet_Name
#   rg_Name            = var.rg_Name
#   location           = var.location
#   vnet_Address       = var.vnet_Address
#   subnet_NameList    = var.subnet_NameList
#   subnet_AddressList = var.subnet_AddressList
# }

#######################################################

######## 7. Azure Web App Deployment ###########
## Since site_config is dynamic and based on the framework. Site config needs to be changed in the WebApp module manually

# Create the Linux App Service Plan
data "azurerm_app_service_plan" "app_svc_plan" {
  name                = var.app_plan
  resource_group_name = var.rg_Name
}

module "webapp" {
  source       = "../terraform-modules/webapp"
  app_svc_id   = data.azurerm_app_service_plan.app_svc_plan.id
  web_app_name = var.web_app_name
  rg_Name      = var.rg_Name
  location     = var.location
}

######## 8. Azure SQL Server Deployment ###########

data "azurerm_sql_server" "sql_server" {
  name                = var.exis_sql_server
  resource_group_name = var.rg_Name
}

module "sqlserver" {
  source       = "../terraform-modules/sql"
  sqlserver_id = data.azurerm_sql_server.sql_server.id
  rg_Name      = var.rg_Name
  location     = var.location
  sql_version  = var.sql_version
  mssqldb      = var.mssqldb
  #mssql_serverid      = module.sqlserver.id
  sql_collation         = var.sql_collation
  sql_license_type      = var.sql_license_type
  sql_db_max_size       = var.sql_db_max_size
  sql_sku_name          = var.sql_sku_name
  short_term_ret_days   = var.short_term_ret_days
  weekly_retention      = var.weekly_retention
  monthly_retention     = var.monthly_retention
  yearly_retention      = var.yearly_retention
  week_of_year          = var.week_of_year
  sql_elastic_pool_name = var.sql_elastic_pool_name
  sql_server_name       = data.azurerm_sql_server.sql_server.name


}