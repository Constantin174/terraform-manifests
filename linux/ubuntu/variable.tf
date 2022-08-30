variable "timezone" {
  type         = string
  description  = "Resource timezone"
  default      = "ru-central1-a"
}

variable "yandex_cloud_id" {
  description  = "YC cloud ID"
  type         = string
  default      = ""
}

variable "yandex_folder_id" {
  description  = "YC folder ID"
  type         = string
  default      = ""
}

variable "access_key" {
  description  = "YC access key for backend S3"
  type         = string
  default      = ""
}

variable "secret_key" {
  description  = "YC access key for backend S3"
  type         = string
  default      = ""
}

variable "image_family" {
  description  = "Resource image family"
  type         = string
  default      = "ubuntu-2004-lts"
}
