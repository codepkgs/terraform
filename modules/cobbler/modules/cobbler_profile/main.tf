resource "cobbler_profile" "profile" {
  name                = var.profile_name
  distro              = var.profile_distro
  kickstart           = var.profile_ks
  enable_menu         = var.boot_menu
  name_servers        = var.profile_ns
  name_servers_search = var.profile_ns_search
  kernel_options      = var.profile_kernel_options
  repos               = length(var.profile_repos) == 0 ? null : var.profile_repos
}
