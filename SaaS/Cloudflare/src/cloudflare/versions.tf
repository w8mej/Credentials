terraform {
  required_version = ">= 1.6.0"  

  required_providers {
    cloudflare = {
      source  = "hashicorp/cloudflare"
      version = "~> 4.22.0"  
    }
  }
}
