data "template_file" "userdata_win" {
  template = file("user_data.tpl")
  vars = {
    windows_password = var.password
  }
}

resource "yandex_compute_instance" "windows_resource" {

  name            = "windows-resource"
  zone            = var.timezone
  hostname        = var.hostname
  platform_id     = var.platform_id

  resources {
    cores         = 4
    memory        = 4
    core_fraction = var.core_fraction
  }

  boot_disk {
    initialize_params {
      image_id    = data.yandex_compute_image.vm-image.id
      name        = "root-node-windows"
      type        = var.type
      size        = var.size
    }
  }
  
  lifecycle {
    ignore_changes = [boot_disk]
  }

  network_interface {
    subnet_id     = yandex_vpc_subnet.subnet.id
    nat           = true
    nat_ip_address = yandex_compute_instance.windows_resource.network_interface["0"].nat_ip_address
    ip_address     = yandex_compute_instance.windows_resource.network_interface["0"].ip_address
  }

  metadata = {
    user-data     = data.template_file.userdata_win.rendered
    ssh-keys      = "user:${file(var.private_key)}"
    serial-port-enable = var.serial-port-enable
  }
  
  provisioner "remote-exec" {
    connection {
      type        = var.type_remote_exec
      user        = var.user
      host        = self.network_interface["0"].nat_ip_address
      private_key = file("${var.private_key}")
      password    = var.password
      https       = var.https
      port        = var.port
      insecure    = var.insecure
      timeout     = var.timeout
    }
    inline = [
      "echo check connection"
    ]
  }
}

data "yandex_compute_image" "vm-image" {
    family        = var.image_family
}

provider "yandex" {
  cloud_id        = var.yandex_cloud_id
  folder_id       = var.yandex_folder_id
  zone            = var.timezone
}

