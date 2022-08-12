resource "yandex_compute_instance" "windows-resource" {
  name       = "windows-resource"
  zone       = var.timezone
  hostname   = "windows.yc"
  count      = 1

  resources {
    cores    = 4
    memory   = 4
  }

  boot_disk {
    initialize_params {
      image_id    = local.image_id_map[terraform.workspace].id
      name        = "root-node-windows"
      type        = "network-nvme"
      size        = "30"
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet.id
    nat       = true
  }

  metadata = {
    ssh-keys = "user:${file("~/.ssh/id_rsa.pub")}"
  }
}

data "yandex_compute_image" "windows-2019-dc-gvlk-rds-5" {
    family = "windows-2019-dc-gvlk-rds-5"
}

provider "yandex" {
  cloud_id  = var.yandex_cloud_id
  folder_id = var.yandex_folder_id
  zone      = var.timezone
}

locals {
  image_id_map = {
    stage = data.yandex_compute_image.windows-2019-dc-gvlk-rds-5
    prod = data.yandex_compute_image.windows-2019-dc-gvlk-rds-5
  }
}
