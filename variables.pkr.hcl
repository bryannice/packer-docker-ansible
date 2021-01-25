variable "ansible_playbook_path" {
  default = ""
  description = "Ansible playbook path."
  type = string
}

variable "base_container_image" {
  default = ""
  description = "The base image for the Docker container that will be started."
  type = string
}

variable "container_entrypoint" {
  default = ""
  description = "Docker repository to push built image to."
  type = string
}

variable "container_image_repository" {
  default = ""
  description = "Docker repository to push built image to."
  type = string
}

variable "container_image_tag" {
  default = "0.0.0"
  type = string
}

variable "container_registry_password" {
  default = ""
  description = "Container registry password"
  type = string

}

variable "container_registry_server" {
  default = "https://index.docker.io/v1/"
  description = "Container registry server url"
  type = string
}

variable "container_registry_username" {
  default = ""
  description = "Container registry username"
  type = string
}

variable "container_working_directory" {
  default = ""
  description = "Docker repository to push built image to."
  type = string
}