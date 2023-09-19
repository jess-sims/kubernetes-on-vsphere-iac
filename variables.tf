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

variable "vm_name" {
    description = "The name of the VM to create"
    default = "terraform-test-2"
    type = string
  
}

variable guest_id {
    description = "The guest ID of the VM to create"
    default = "ubuntu64Guest"
    type = string
  
}
 
variable vm_cpus {
    description = "The number of CPUs for the VM"
    default = 2
    type = number
  
}

variable vm_memory {
    description = "The amount of memory for the VM"
    default = 2048
    type = number
  
}

variable template_name {
    description = "The name of the template to use for cloning"
    default = "ubuntu-22.04.2-desktop-amd64"
    type = string
  
}