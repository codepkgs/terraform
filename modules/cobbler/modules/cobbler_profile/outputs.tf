output "profile_name" {
  value = cobbler_profile.profile.name
}

output "profile_kickstart" {
  value = cobbler_profile.profile.kickstart
}

output "profile_name_servers" {
  value = cobbler_profile.profile.name_servers
}

output "profile_name_servers_search" {
  value = cobbler_profile.profile.name_servers_search
}

output "profile_distro" {
  value = cobbler_profile.profile.distro
}

output "profile_repos" {
  value = cobbler_profile.profile.repos
}
