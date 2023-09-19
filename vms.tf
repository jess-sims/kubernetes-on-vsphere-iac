# Create a VM from a template
resource "vsphere_virtual_machine" "vm_leader"{
  name = var.vm_name
  resource_pool_id = data.vsphere_resource_pool.pool.id
  datastore_id =  data.vsphere_datastore.datastore.id
  wait_for_guest_net_timeout = 0

  num_cpus = var.vm_cpus
  memory = var.vm_memory
  guest_id = var.guest_id

  network_interface {
    network_id = data.vsphere_network.network.id
    adapter_type = "vmxnet3"
  }
  

  disk {
    label = "terraformtest-test-2.vmdk"
    thin_provisioned = true
    size = 20
  }

  # cdrom {
  #   datastore_id = data.vsphere_datastore.datastore.id
  #   path = "ubuntu-22.04.2-desktop-amd64.iso"
  # }

  clone {
    template_uuid = data.vsphere_virtual_machine.template.id
  }

  vapp {
    properties ={
      hostname = var.hostname
      user-data = base64encode(file("${path.module}/cloudinit/kickstart.yaml"))
    }
  }

  extra_config = {
    "guestinfo.metadata"          = base64encode(file("${path.module}/cloudinit/metadata.yaml"))
    "guestinfo.metadata.encoding" = "base64"
    "guestinfo.userdata"          = base64encode(file("${path.module}/cloudinit/userdata.yaml"))
    "guestinfo.userdata.encoding" = "base64"
  }

}


# Create a VM from a template
resource "vsphere_virtual_machine" "vm_worker" {
  name = var.vm_name
  resource_pool_id = data.vsphere_resource_pool.pool.id
  datastore_id =  data.vsphere_datastore.datastore.id
  wait_for_guest_net_timeout = 0
  depends_on = [ vsphere_virtual_machine.vm_leader ]
  num_cpus = var.vm_cpus
  memory = var.vm_memory
  guest_id = var.guest_id

  network_interface {
    network_id = data.vsphere_network.network.id
    adapter_type = "vmxnet3"
  }
  

  disk {
    label = "terraformtest-test-2.vmdk"
    thin_provisioned = true
    size = 20
  }

  # cdrom {
  #   datastore_id = data.vsphere_datastore.datastore.id
  #   path = "ubuntu-22.04.2-desktop-amd64.iso"
  # }

  clone {
    template_uuid = data.vsphere_virtual_machine.template.id
  }

  vapp {
    properties ={
      hostname = var.hostname
      user-data = base64encode(file("${path.module}/cloudinit/kickstart.yaml"))
    }
  }

  extra_config = {
    "guestinfo.metadata"          = base64encode(file("${path.module}/cloudinit/metadata.yaml"))
    "guestinfo.metadata.encoding" = "base64"
    "guestinfo.userdata"          = base64encode(file("${path.module}/cloudinit/userdata.yaml"))
    "guestinfo.userdata.encoding" = "base64"
  }


}