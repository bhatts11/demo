# resource "azurerm_mssql_server" "sqlserver" {
#   name                         = var.sqlservername
#   resource_group_name          = var.rg_Name
#   location                     = var.location
#   version                      = var.sql_version
#   administrator_login          = var.sql_user
#   administrator_login_password = var.sql_password
# }

# # Enables the "Allow Access to Azure services" box as described in the API docs
# # https://docs.microsoft.com/en-us/rest/api/sql/firewallrules/createorupdate
# resource "azurerm_sql_firewall_rule" "sqlfirewall" {
#   name                = "allow-azure-services"
#   resource_group_name = var.rg_Name
#   server_name         = azurerm_sql_server.sqlserver.name
#   start_ip_address    = "0.0.0.0"
#   end_ip_address      = "0.0.0.0"
# }

resource "azurerm_mssql_database" "mssqldb" {
  name         = var.mssqldb
  server_id    = var.sqlserver_id
  collation    = var.sql_collation    #"SQL_Latin1_General_CP1_CI_AS"
  license_type = var.sql_license_type #"LicenseIncluded"
  max_size_gb  = var.sql_db_max_size
  sku_name     = var.sql_sku_name

  #   tags = {
  #     foo = "bar"
  #   }

  short_term_retention_policy {
    retention_days = var.short_term_ret_days
  }

  long_term_retention_policy {
    weekly_retention  = var.weekly_retention
    monthly_retention = var.monthly_retention
    yearly_retention  = var.yearly_retention
    week_of_year      = var.week_of_year
  }
}

resource "azurerm_mssql_elasticpool" "sql_elastic" {
  name                = var.sql_elastic_pool_name
  resource_group_name = var.rg_Name
  location            = var.location
  server_name         = var.sql_server_name
  license_type        = "LicenseIncluded"
  max_size_gb         = 4.8828125
  #max_size_bytes = 4000

  sku {
    name     = "BasicPool"
    tier     = "Basic"
    # family   = "Gen4"
    capacity = 50
  }

  per_database_settings {
    min_capacity = 0
    max_capacity = 5
  }
}