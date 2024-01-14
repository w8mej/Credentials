output "oci_user_name" {
  description = "The name of the OCI user."
  value       = oci_identity_user.thesorrow.name
}

output "oci_user_email" {
  description = "The email address of the OCI user."
  value       = oci_identity_user.thesorrow.email
}

output "oci_identity_user_group_membership" {
  description = "The group memberships of the OCI user."
  value       = [for group in oci_identity_user_group_membership.thesorrow_group_membership : group.group_name]
}
