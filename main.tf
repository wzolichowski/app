provider "azurerm" {
    features {}
}

resource "azurerm_resource_group" "rg" {
    name = "hello-cloud-rg"
    location = "west europe"

}

resource "azurerm_app_service_plan" "plan" {
    name = "hello-cloud-plan"
    location = azurerm_resource_group.rg.location
    resource_group_name = azurerm_resource_group.name
    sku {
        tier = "Basic"
        size = "B1"
    }
}

resource "azurerm_app_service" "app" {
    name = "hello-cloud-app"
    location = azurerm_resource_group.location
    resource_group_name = azurerm_resource_group.name
    app_service_plan_id = azurerm_app_service_plan.plan.id

    site_config {
        linux_fx_version ="DOCKER|<username>/<imagename>:latest"

    }

    app_settings = {
        WEBSITES_PORT = "80"
    }
}