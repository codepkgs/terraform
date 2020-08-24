resource "cobbler_kickstart_file" "kickstart" {
  name = format("/var/lib/cobbler/kickstarts/%s", var.kickstart_filename)
  body = var.kickstart_contents
}
