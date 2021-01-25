locals {
  changes = [
    var.container_working_directory,
    var.container_entrypoint,
  ]
  tag = [
    "latest",
    var.container_image_tag,
  ]
}