terraform {

  backend "s3" {
      bucket = var.bucket
      key    = var.key
      endpoints = { s3 = var.s3_endpoint }
      region = var.region
      access_key = var.env_access_key
      secret_key = var.env_secret_key
      skip_credentials_validation = true
      skip_region_validation = true
      skip_requesting_account_id  = true
      skip_metadata_api_check     = true
      skip_s3_checksum = true
    }
}