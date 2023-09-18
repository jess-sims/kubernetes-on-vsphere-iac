variable "vsphere_server" {
  type = string
}

variable "vsphere_user" {
  type = string
}

variable "vsphere_password" {
  type = string
}

variable "datastore" {
    description = "The name of the datastore to use for VM disks"
    default = "datastore1"
    type = string
  
}