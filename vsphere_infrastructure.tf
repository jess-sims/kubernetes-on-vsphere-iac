data "vsphere_resource_pool" "pool" {
}

data "vsphere_datacenter" "datacenter" {
  name = "satic.your-server.de"
}

data "vsphere_datastore" "datastore" {
  name          = var.datastore
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_network" "network" {
  name          = "VM Network Portgroup"
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data vsphere_virtual_machine "template" {
  name          = var.template_name
  datacenter_id = data.vsphere_datacenter.this.id
}

data "vsphere_content_library" "content_library" {
  name = "clb-01"
}