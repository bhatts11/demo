# # Create the Linux App Service Plan
# data "azurerm_app_service_plan" "app_svc_plan" {
#   name                = var.app_plan
#   resource_group_name = var.rg_Name
# }


# Create the web app, pass in the App Service Plan ID, and deploy code from a public GitHub repo
resource "azurerm_app_service" "webapp" {
  name                = var.web_app_name
  location            = var.location
  resource_group_name = var.rg_Name
  app_service_plan_id = var.app_svc_id

  # Since this varies based on the runtime being used these values need to be changed based on the requirement :
  # Please refer https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/app_service#acr_use_managed_identity_credentials for detailed options.
  site_config {
    dotnet_framework_version = "v4.0"
  }

  # Required if using windows_fx_version or linux_fx_version in site_config section
  #     app_settings = {
  #     "DOCKER_REGISTRY_SERVER_URL"      = "https://mcr.microsoft.com",
  #     "DOCKER_REGISTRY_SERVER_USERNAME" = "",
  #     "DOCKER_REGISTRY_SERVER_PASSWORD" = "",
  #   }

  #  source_control {
  #    repo_url           = "https://github.com/Azure-Samples/nodejs-docs-hello-world"
  #    branch             = "master"
  #    manual_integration = true
  #    use_mercurial      = false
  #  }

}