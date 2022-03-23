subscription_id = "aa01771c-5ab3-4809-b7e6-30c8080fc4ee"
## Pre Defined KV for storing secret
## VNET - SUBNET
rg_Name            = "rg-vantage-ehc" ## We have to change as per env
location           = "eastus"
vnet_Name          = "vnet-terraform-modulesdev-eus2"
vnet_Address       = "178.29.212.0/22"
subnet_NameList    = ["snet-aks-terraform-modulesdev-eus2", "snet-agw-terraform-modulesdev-eus2", "snet-shared-terraform-modulesdev-eus2", "GatewaySubnet"]
subnet_AddressList = ["178.29.212.0/23", "178.29.214.64/28", "178.29.214.0/26", "178.29.215.0/27"]

### App Service Plan and Web App
app_plan     = "vantageapp"
web_app_name = "terra-test-web"

### SQL Server deployment
sqlservername = "sushterratest"
sql_version   = "12.0"
# sql_user        = var.sql_user # This will be fetched from key vault using data source
# sql_password    = var.sql_password # This will be fetched from key vault using data source
sqlkv_AdmUsr          = "sqluser"     # Name of the key vault secret used to store User name
sqlkv_AdmPasswd       = "sqlpassword" # Name of the key vault secret used to store SQL Password
exis_sql_server       = "vantagesql1"
sql_elastic_pool_name = "elasticvantagep1"
### SQL Database deployment

mssqldb             = "testterradb"
sql_collation       = "SQL_Latin1_General_CP1_CI_AS"
sql_license_type    = "LicenseIncluded"
sql_db_max_size     = 4
sql_sku_name        = "BC_Gen5_2"
short_term_ret_days = 15
weekly_retention    = "P7D"
monthly_retention   = "P1M"
yearly_retention    = "P365D"
week_of_year        = 4
