terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  
  required_version = ">= 0.15"
  
  backend "s3" {
    endpoint   = "storage.yandexcloud.net"
    bucket     = "test-infrastructure-object-strorage"
    region     = "ru-central1-a"
    key        = ".terraform/terraform.tfstate"
    skip_region_validation      = true
    skip_credentials_validation = true
  }
}

