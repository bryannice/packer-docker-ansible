build {
  name = "docker-ansible"

  sources = [
    "source.docker.ansible",
  ]

  provisioner "ansible" {
    playbook_file = format("%s/playbook.yml", var.ansible_playbook_path)
  }

  post-processors {
    post-processor "docker-tag" {
      force = true
      keep_input_artifact = true
      repository = var.container_repository
      tag = local.tag
    }

    post-processor "docker-push" {
      login = true
      login_server = var.container_registry_server
      login_username = var.container_registry_username
      login_password = var.container_registry_password
    }
  }
}
