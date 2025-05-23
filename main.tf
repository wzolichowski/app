provider "azurerm" {
  features {}
  subscription_id = "ccc3b844-dd78-42fe-b922-2be22fd5f654"
}

resource "azurerm_resource_group" "rg" {
  name     = "hello-cloud-rg"
  location = "westeurope"
}

resource "azurerm_service_plan" "plan" {
  name                = "hello-cloud-plan"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  os_type             = "Linux"
  sku_name            = "B1"
}

resource "azurerm_linux_web_app" "app" {
  name                = "hello-cloud-app"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  service_plan_id     = azurerm_service_plan.plan.id

  site_config {
    application_stack {
      docker_image_name = "wzolich/app:latest"
    }
  }

  app_settings = {
    WEBSITES_PORT = "80"
  }
}
