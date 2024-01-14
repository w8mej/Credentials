terraform {
  required_version = ">= 1.6.0"  

  required_providers {
    oci = {
      source  = "hashicorp/oci"
      version = "~> 5.24.0"  
    }
  }
}
