resource "azurerm_cosmosdb_account" "acc" {
  name                = "cosmos-acc-${random_string.suffix.result}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  offer_type          = "Standard"
  kind                = "GlobalDocumentDB"

  geo_location {
    location          = var.location
    failover_priority = 0
  }

  consistency_policy { consistency_level = "Session" }

  capabilities {
    name = "EnableServerless"
  }
}


resource "azurerm_cosmosdb_sql_database" "db" {
  name                = "FilmReviewDB"
  resource_group_name = azurerm_resource_group.rg.name
  account_name        = azurerm_cosmosdb_account.acc.name
}

resource "azurerm_cosmosdb_sql_container" "films_container" {
  name                = "Films"
  resource_group_name = azurerm_resource_group.rg.name
  account_name        = azurerm_cosmosdb_account.acc.name
  database_name       = azurerm_cosmosdb_sql_database.db.name
  partition_key_paths = ["/year"]
}
