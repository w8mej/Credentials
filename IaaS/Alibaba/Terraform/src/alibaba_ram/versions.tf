terraform {
  required_version = ">= 1.6.0"  

  required_providers {
    alicloud = {
      source  = "hashicorp/alicloud"
      version = "~> 1.214.1"  
    }
  }
}
