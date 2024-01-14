resource "oci_identity_user" "thesorrow" {
  name        = var.oci_user_name
  description = var.oci_user_comments
  compartment_id = var.compartment_id
  email       = var.oci_user_email
}

resource "oci_identity_user_group_membership" "thesorrow_membership" {

  for_each  = toset(var.oci_user_groups)
  user_id  = oci_identity_user.thesorrow.id
  group_id = each.value
}

resource "oci_identity_api_key" "thesorrow_api_key" {
  user_id    = oci_identity_user.thesorrow.id
  key_value  = var.ssh_key
}
