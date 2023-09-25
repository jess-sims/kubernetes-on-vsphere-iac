# ---------------------------------------------------------------------------------------------------------------------
# VMWARE PROVIDER VARIABLES
# These are used to connect to vCenter.
# ---------------------------------------------------------------------------------------------------------------------

variable "vsphere_server" {
  type = string
}

variable "vsphere_user" {
  type = string
}

variable "vsphere_password" {
  type = string
}

# ---------------------------------------------------------------------------------------------------------------------
# VMWARE DATA SOURCE VARIABLES
# These are used to discover unmanaged resources used during deployment.
# ---------------------------------------------------------------------------------------------------------------------


variable datacenter_name {
  type        = string
  description = "The name of the vSphere Datacenter into which resources will be created."
  default = "Datacenter"
}

#variable cluster_name {
#  type        = string
#  description = "The vSphere Cluster into which resources will be created."
#}

variable "datastore" {
    description = "The name of the datastore to use for VM disks"
    default = "datastore1"
    type = string
  
}

#variable datastore_cluster_name {
#  type    = string
#  default = ""
#}


# ---------------------------------------------------------------------------------------------------------------------
# VMWARE RESOURCE VARIABLES
# Variables used during the creation of resources in vSphere.
# ---------------------------------------------------------------------------------------------------------------------

variable "vm_name_leader" {
    description = "The name of the Leader VM to create"
    type = string
    default = "vm-leader"
  
}

variable "vm-prefix" {
    description = "The name of the VM to create"
    type = string
  
}

variable "worker-count" {
    description = "The number of worker VMs to create"
    type = number
  
}

variable guest_id {
    description = "The guest ID of the VM to create"
    type = string
  
}
 
variable vm_cpus {
    description = "The number of CPUs for the VM"
    type = number
  
}

variable vm_memory {
    description = "The amount of memory for the VM"
    type = number
  
}

variable vm_network_name {
  description = "value of the network name"
  type = string
}

variable template_name {
    description = "The name of the template to use for cloning"
    type = string
  
}

variable "hostname" {
    description = "The hostname of the VM"
    type = string
    
}

variable "esxi_host" {
    description = "The hostname of the ESXi host"
    type = string   
}

