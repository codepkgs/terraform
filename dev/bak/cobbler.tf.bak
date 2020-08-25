# 定义cobble kickstart 相关的信息
locals {
  cobbler_kickstart = {
    kickstart_filename   = "centos7.ks"
    kickstart_local_path = "files/cobbler_centos7.ks"
  }
}

# 定义cobbler profile相关的信息
locals {
  cobbler_profile = {
    # cobbler profile 
    profile_name      = "CentOS7_1810-x86_64"
    profile_distro    = "CentOS7.6_1810-x86_64"
    profile_ks        = "/var/lib/cobbler/kickstarts/centos7.ks"
    profile_ns        = ["10.0.100.1"]
    profile_ns_search = ["fdisk.cc"]
  }
}

# 定义要创建的vm的信息
locals {
  vm18 = {
    # vsphere virtual machine config
    num_cpus             = 4
    num_cores_per_socket = 4
    memory               = 8
    name                 = "zhanghe-100-18"
    guest_id             = "centos7_64Guest"
    hostname             = "vm18.fdisk.cc"
    ip_address           = "10.0.100.18"
    netmask              = "255.255.255.0"
    gateway              = "10.0.100.254"
    mac_address          = "00:50:56:10:00:01"

    # cobbler system
    netboot_enable      = true
    profile             = module.cobbler_profile_centos7_1810.profile_name
    name_servers        = module.cobbler_profile_centos7_1810.profile_name_servers
    name_servers_search = module.cobbler_profile_centos7_1810.profile_name_servers_search
    kickstart           = module.cobbler_profile_centos7_1810.profile_kickstart
  }

  vm19 = {
    # vsphere virtual machine config
    num_cpus             = 4
    num_cores_per_socket = 4
    memory               = 8
    name                 = "zhanghe-100-19"
    guest_id             = "centos7_64Guest"
    hostname             = "vm19.fdisk.cc"
    ip_address           = "10.0.100.19"
    netmask              = "255.255.255.0"
    gateway              = "10.0.100.254"
    mac_address          = "00:50:56:10:00:02"

    # cobbler system
    netboot_enable      = true
    profile             = module.cobbler_profile_centos7_1810.profile_name
    name_servers        = module.cobbler_profile_centos7_1810.profile_name_servers
    name_servers_search = module.cobbler_profile_centos7_1810.profile_name_servers_search
    kickstart           = module.cobbler_profile_centos7_1810.profile_kickstart
  }
}

# 创建cobbler kickstart file
module "cobbler_kickstart_centos7" {
  source = "../modules/cobbler/modules/cobbler_kickstart_file"

  # filename is : /var/lib/cobbler/kickstarts/centos7.ks
  kickstart_filename = local.cobbler_kickstart.kickstart_filename
  kickstart_contents = file(local.cobbler_kickstart.kickstart_local_path)
}

# 创建cobbler profile
module "cobbler_profile_centos7_1810" {
  source = "../modules/cobbler/modules/cobbler_profile"

  profile_name      = local.cobbler_profile.profile_name
  profile_distro    = local.cobbler_profile.profile_distro
  profile_ks        = local.cobbler_profile.profile_ks
  profile_ns        = local.cobbler_profile.profile_ns
  profile_ns_search = local.cobbler_profile.profile_ns_search

  depends_on = [
    module.cobbler_kickstart_centos7
  ]
}

# 创建虚拟机
module "vsphere_vm18" {
  source = "../modules/vsphere/modules/virtual_machine"

  name                 = local.vm18.name
  firmware             = "bios"
  num_cpus             = local.vm18.num_cpus
  num_cores_per_socket = local.vm18.num_cores_per_socket
  memory               = local.vm18.memory
  guest_id             = local.vm18.guest_id

  disks = [
    {
      label            = "disk0"
      size             = 60
      unit_number      = 0
      thin_provisioned = true
    },
    {
      label            = "disk1"
      size             = 200
      unit_number      = 1
      thin_provisioned = true
    },
    {
      label            = "disk2"
      size             = 200
      unit_number      = 2
      thin_provisioned = true
    }
  ]

  network_interfaces = [
    {
      pg_name        = "LAN"
      use_static_mac = true
      mac_address    = local.vm18.mac_address
    }
  ]

  depends_on = [
    module.cobbler_system_vm18
  ]
}

# 创建 cobbler system
module "cobbler_system_vm18" {
  source = "../modules/cobbler/modules/cobbler_system"

  name                = local.vm18.hostname
  hostname            = local.vm18.hostname
  profile             = local.vm18.profile
  name_servers        = local.vm18.name_servers
  name_servers_search = local.vm18.name_servers_search
  gateway             = local.vm18.gateway
  netboot_enable      = local.vm18.netboot_enable
  kickstart           = local.vm18.kickstart

  interfaces = [
    {
      name        = "eth0"
      ip_address  = local.vm18.ip_address
      netmask     = local.vm18.netmask
      static      = true
      mac_address = local.vm18.mac_address
    }
  ]
}
