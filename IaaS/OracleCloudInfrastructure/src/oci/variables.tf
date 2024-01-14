variable "tenancy_ocid" {
  description = "The OCI tenant unique ID."
  type        = string
}
variable "user_ocid" {
  description = "The OCI user ID."
  type        = string
}
variable "fingerprint" {
  description = "The key's fingerprint."
  type        = string
}
variable "private_key_path" {
  description = "The fs path to the private key."
  type        = string
}
variable "region" {
  description = "The OCI region for the user."
  type        = string
}

variable "bucket" {
  description = "The OCI bucket handling the terraform state"
  type        = string
}

variable "compartment_id" {
  description = "The OCI compartment."
  type        = string
}

variable "key" {
  description = "The OCI terraform state key name."
  type        = string
}

variable "ssh_key" {
  description = "The OCI ssh key identifier."
  type        = string
}

variable "oci_user_name" {
  description = "The name of the OCI user."
  type        = string
}

variable "oci_user_email" {
  description = "The email address of the OCI user."
  type        = string
}

variable "oci_user_comments" {
  description = "The comment about the OCI user."
  type        = string
}

variable "oci_user_groups" {
  description = "List of groups associated to the OCI user."
  type        = list(string)
}
