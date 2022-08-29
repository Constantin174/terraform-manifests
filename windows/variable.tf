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

variable "timezone" {
  type         = string
  default      = "ru-central1-a"
}

variable "access_key" {
  type         = string
  default      = ""
}

variable "secret_key" {
  type         = string
  default      = ""
}

variable "image_family" {
  type         = string
  default      = "windows-2022-dc-gvlk"
}

variable "type_remote_exec" {
  type         = string
  default      = "winrm"
}

variable "user" {
  type         = string
  default      = "Administrator"
}

variable "password" {
  type         = string
  default      = "password"
}

variable "private_key" {
  type         = string
  default      = "~/.ssh/id_rsa.pub"
}

variable "https" {
  type         = bool
  default      = true
}

variable "port" {
  type         = string
  default      = "5986"
}

variable "insecure" {
  type         = bool
  default      = true
}

variable "timeout" {
  type         = string
  default      = "15m"
}

variable "serial-port-enable" {
  description  = "Serial-port-enable parameter for metadata"
  type         = number
  default      = 1
}

variable "instance_count" {
  description  = "YC compute instance count"
  default      = 1
}

variable "type" {
  description = "Type of the boot disk"
  type        = string
  default     = "network-ssd"
}

variable "size" {
  description = "Size of the boot disk in GB"
  type        = string
  default     = "10"
}

variable "hostname" {
  description = "Host name for the instance. This field is used to generate the instance fqdn value"
  type        = string
  default     = "windows.yc"
}

variable "platform_id" {
  description = "The type of virtual machine to create"
  type        = string
  default     = "standard-v3"
}

variable "core_fraction" {
  description = "Baseline performance for a core as a percent"
  type        = number
  default     = 100
}

