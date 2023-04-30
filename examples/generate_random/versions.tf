terraform {
  required_version = ">= 0.13"
  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "3.5.1"
    }
    scaleway = {
      source  = "scaleway/scaleway"
      version = "~> 2"
    }
  }
}
