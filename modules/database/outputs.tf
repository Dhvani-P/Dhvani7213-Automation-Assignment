output "db_server_name" {
  value = azurerm_postgresql_server.DB_server.name
}

output "db_name" {
  value = azurerm_postgresql_database.DB-postgre.name
}
