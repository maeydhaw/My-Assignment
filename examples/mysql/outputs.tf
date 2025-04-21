output "endpoint" {
  value       = module.three_tier_app.endpoint
  description = "The url of the front end which we want to surface to the user"
}

output "sqlservername" {
  value       = module.three_tier_app.sqlservername
  description = "The name of the database that we randomly generated."
}