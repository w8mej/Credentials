variable "ram_user_name" {
  description = "The name of the RAM user."
  type        = string
}

variable "ram_user_display_name" {
  description = "The display name of the RAM user."
  type        = string
}

variable "ram_user_mobile" {
  description = "The mobile number of the RAM user."
  type        = string
}

variable "ram_user_email" {
  description = "The email address of the RAM user."
  type        = string
}

variable "ram_user_comments" {
  description = "The comment about the RAM user."
  type        = string
}

variable "ram_user_pgp" {
  description = "The pgp base64 public key of the RAM user."
  type        = string
}

variable "ram_user_policies" {
  description = "List of policy names attached to the RAM user."
  type        = list(string)
}

variable "ram_user_groups" {
  description = "List of groups associated to the RAM user."
  type        = list(string)
}
