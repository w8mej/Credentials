# Environment variables start with TF_VAR_....
variable "env_access_key" {}

variable "env_secret_key" {}

variable api_token {}

variable max_backoff {}

variable min_backoff {}

variable retries {}

variable rps {}

## End of environment variables definition
variable "s3_endpoint" {
  description = "The s3 compatible endpoint handling the terraform objects."
  type        = string
}

variable "key" {
  description = "The key holding the terraform state."
  type        = string
}

variable "region" {
  description = "The S3 bucket region."
  type        = string
}



variable "bucket" {
  description = "the s3 compat. bucket handling the terraform."
  type        = string
}

variable "user_email" {
  description = "The user's cloudflare associated email."
  type        = string
}

variable "role_ids" {
  description = "the user's different roles."
  type        = list(string)
}

variable "status" {
  description = "The user's state in cloudflare."
  type        = string
}

variable "account_id" {
  description = "The Cloudflare account the user is located within."
  type        = string
}
