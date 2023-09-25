provider "vsphere" {
  user = var.vsphere_user 
  password = var.vsphere_password
  vsphere_server = var.vsphere_server

# If you have a self-signed cert
  allow_unverified_ssl = true
}

# locals {
#   leader_customization = {
#     hostname = "${var.hostname}-leader"
#     commands = ""
#     }

#   worker_customization = {
#     hostname = "${var.hostname}-worker"
#     commands = ""
#   }
# }