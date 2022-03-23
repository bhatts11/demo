variable "subscription_id" {
  type    = string
  default = ""
}
variable "location" {
  type    = string
  default = ""
}
variable "rg_Name" {
  type    = string
  default = ""
}


variable "app_plan_name" {
  type        = string
  default     = ""
  description = "App service plan name for webapp"
}
variable "appsvcplan_kind" {
  type        = string
  default     = "Windows"
  description = "The kind of the App Service Plan to create. Possible values are Windows (also available as App), Linux, elastic (for Premium Consumption) and FunctionApp (for a Consumption Plan). Defaults to Windows. Changing this forces a new resource to be created."
}
variable "appservice_tier" {
  type        = string
  default     = ""
  description = "Azure App service Tier (Standard,Free,Basic, etc .)"
}

variable "appservice_size" {
  type        = string
  default     = ""
  description = "Azure App service Tier size"
}

variable "web_app_name" {
  type        = string
  default     = ""
  description = "Webapp name to deploy the resources"
}

variable "app_plan" {
  type        = string
  default     = ""
  description = "App service plan name for webapp"
}

variable "app_svc_id" {
  type        = string
  default     = ""
  description = "App service plan ID for webapp. This is fetched from existing App Service Plan"
}

variable "sqlservername" {
  type        = string
  default     = ""
  description = "SQL Server name to be used."
}
variable "sql_version" {
  type        = string
  default     = ""
  description = "SQL Server version to be used"
}
variable "sql_user" {
  type        = string
  default     = ""
  description = "SQL Server login username - This will be fetched from KV secrets."
}
variable "sql_password" {
  type        = string
  default     = ""
  description = "SQL Server login password - This will be fetched from KV secrets."
}

variable "sqlkv_AdmUsr" {
  type        = string
  description = "SQL Server Username. This will be fetched from KV"
}

variable "sqlkv_AdmPasswd" {
  sensitive   = true
  type        = string
  description = "SQL Server Password. This will be fetched from KV"
}

variable "mssqldb" {
  type        = string
  default     = ""
  description = "SQL Database name"
}
variable "mssql_serverid" {
  type        = string
  default     = ""
  description = "SQL Server id for the SQL server to be used "
}
variable "sql_collation" {
  type        = string
  default     = "SQL_Latin1_General_CP1_CI_AS"
  description = "SQL database collation"
}
variable "sql_db_max_size" {
  type        = number
  default     = 4
  description = "The max size of the database in gigabytes."
}
variable "sql_sku_name" {
  type        = string
  default     = "BC_Gen5_2"
  description = "Specifies the name of the SKU used by the database"
}
variable "short_term_ret_days" {
  type        = number
  default     = 15
  description = "Point In Time Restore configuration. Value has to be between 7 and 35."
}
variable "weekly_retention" {
  type        = string
  default     = ""
  description = "The weekly retention policy for an LTR backup. Valid value is between 1 to 520 weeks. e.g. P1Y, P1M, P1W or P7D."
}
variable "monthly_retention" {
  type        = string
  default     = ""
  description = "The monthly retention policy for an LTR backup. Valid value is between 1 to 120 months. e.g. P1Y, P1M, P4W or P30D."
}
variable "yearly_retention" {
  type        = string
  default     = ""
  description = "The yearly retention policy for an LTR backup. Valid value is between 1 to 10 years. e.g. P1Y, P12M, P52W or P365D."
}

variable "week_of_year" {
  type        = number
  description = "The week of year to take the yearly backup. Value has to be between 1 and 52."
}

variable "sql_license_type" {
  type        = string
  default     = "LicenseIncluded"
  description = "Specifies the license type applied to this database. Possible values are LicenseIncluded and BasePrice."
}


variable "sqlserver_id" {
  type        = string
  default     = ""
  description = "ID of existing SQL Server. This will be fetched from the subscription."
}

variable "sql_elastic_pool_name" {
  type        = string
  default     = ""
  description = "Name of SQL Elastic Pool to be created."
}

variable "sql_server_name" {
  type        = string
  default     = ""
  description = "Name of SQL Server to be moved to elastic pool. This will also be fetched from existing Subscription."
}

variable "exis_sql_server" {
  type        = string
  default     = ""
  description = "Name of existing SQL Server to be moved to elastic pool."
}
