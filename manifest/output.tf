output "external_ip_address_windows_resource_yc" {
  value = [for item in yandex_compute_instance.windows_resource : item.network_interface.0.nat_ip_address]
}
