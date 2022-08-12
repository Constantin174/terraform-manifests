variable "yandex_cloud_id" {
  description = "YC cloud ID"
  type = string
}

variable "yandex_folder_id" {
  description = "YC folder ID"
  type = string
}

variable "timezone" {
  default = "ru-central1-a"
}

variable "access_key" {
  description = "Service account access key for S3 storage"
  type = string
}

variable "secret_key" {
  description = "Service account secret key for S3 storage"
}
