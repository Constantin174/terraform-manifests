locals {
  subnet_map = {
    stage         = yandex_vpc_subnet.subnet_a
    prod          = yandex_vpc_subnet.subnet_b
  }
  instance_count_map = {
    stage         = 1
    prod          = 2
  }
}

data "yandex_compute_image" "ubuntu-image" {
    family        = var.image_family
}

resource "yandex_compute_image" "ubuntu" {
  name            = "ubuntu"
  zone            = var.timezone
  hostname        = "ubuntu.yc"
  count = local.subnet_map[terraform.workspace]
  
  resources {
    cores         = 2
    memory        = 2
  }
  
  boot_disk {
    initialize_params {
      image_id    = data.yandex_compute_image.ubuntu-image.id
      name        = "root-node-app"
      type        = "network-nvme"
      size        = "10"
    }
  }

  network_interface {
    subnet_id     = local.subnet_map[terraform.workspace].id
    nat           = true
  }

  metadata = {
    ssh-keys      = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
  }
}
