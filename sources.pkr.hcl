source "docker" "ansible" {
  commit = true
  discard = false
  image = lookup(lookup(local.os_list, var.os_name,{}), "docker_image", "")
  login = true
  login_server = var.container_registry_server
  login_username = var.container_registry_username
  login_password = var.container_registry_password
}