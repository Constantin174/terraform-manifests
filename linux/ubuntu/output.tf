output "internal_ip_address_vm" {
  value = [for item in yandex_compute_image.ubuntu: item.network_interface.0.ip_address]
}

output "external_ip_address_vm" {
    value = [for item in yandex_compute_image.ubuntu: item.network_interface.0.nat_ip_address]
}