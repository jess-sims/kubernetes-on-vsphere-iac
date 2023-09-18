provider "vsphere" {
  user = var.vsphere_user 
  password = var.vsphere_password
  vsphere_server = var.vsphere_server

  allow_unverified_ssl = true
}

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

resource "vsphere_virtual_machine" "vm"{
  name = "terraform-test-2"
  resource_pool_id = data.vsphere_resource_pool.pool.id
  datastore_id =  data.vsphere_datastore.datastore.id
  wait_for_guest_net_timeout = 0

  num_cpus = 2
  memory = 2048
  guest_id = "ubuntu64Guest"

  network_interface {
    network_id = data.vsphere_network.network.id
    adapter_type = "vmxnet3"
  }

  disk {
    label = "terraformtest-test-2.vmdk"
    thin_provisioned = true
    size = 20
  }

  cdrom {
    datastore_id = data.vsphere_datastore.datastore.id
    path = "ubuntu-22.04.2-desktop-amd64.iso"
  }

}