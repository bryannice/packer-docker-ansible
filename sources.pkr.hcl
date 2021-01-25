source "docker" "ansible" {
  changes = local.changes
  commit = true
  discard = false
  image = var.base_container_image
  login = true
  login_server = var.container_registry_server
  login_username = var.container_registry_username
  login_password = var.container_registry_password
}