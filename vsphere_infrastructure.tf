data "vsphere_datacenter" "datacenter" {
  name = var.datacenter_name
}

data "vsphere_datastore" "datastore" {
  name          = var.datastore
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_resource_pool" "pool" {
    name          = "Resources"
    datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_network" "network" {
  name          = "VM Network Portgroup"
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data vsphere_virtual_machine "template" {
  name          = var.template_name
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_content_library" "content_library" {
  name = "cl1"
}

data "vsphere_host" "host" {
    name          = var.esxi_host
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

 data vsphere_content_library_item "content_library_item" {
   name              = "ubuntu-22.04-server-cloudimg-amd64"
   type = "ovf"
   library_id = data.vsphere_content_library.content_library.id
 }