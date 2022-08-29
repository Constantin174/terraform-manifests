# Network
resource "yandex_vpc_network" "network" {
  name           = "net"
}

resource "yandex_vpc_subnet" "subnet" {
  name           = "subnet"
  zone           = var.timezone
  network_id     = yandex_vpc_network.network.id
  v4_cidr_blocks = ["192.168.101.0/24"]
}

