terraform {
 backend "oci" {
    bucket        = var.bucket
    compartment_id = var.compartment_id
    region        = var.region
    tenancy_ocid  = var.tenancy_ocid
    user_ocid     = var.user_ocid
    key           = var.key
    fingerprint   = var.fingerprint
    private_key_path = var.private_key_path
  }
}
