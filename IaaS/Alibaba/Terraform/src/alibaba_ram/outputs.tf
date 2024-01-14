output "ram_user_name" {
  description = "The name of the RAM user."
  value       = alicloud_ram_user.thesorrow.name
}

output "ram_user_display_name" {
  description = "The display name of the RAM user."
  value       = alicloud_ram_user.thesorrow.display_name
}

output "ram_user_mobile" {
  description = "The mobile number of the RAM user."
  value       = alicloud_ram_user.thesorrow.mobile
}

output "ram_user_email" {
  description = "The email address of the RAM user."
  value       = alicloud_ram_user.thesorrow.email
}

output "ram_user_access_key_id" {
  description = "The access key ID of the RAM user."
  value       = alicloud_ram_access_key.thesorrow_key.id
}

output "ram_user_group_memberships" {
  description = "The group memberships of the RAM user."
  value       = [for group in alicloud_ram_group_membership.thesorrow_group_membership : group.group_name]
}

output "ram_user_policy_attachments" {
  description = "The policy attachments of the RAM user."
  value       = [for policy in alicloud_ram_user_policy_attachment.thesorrow_policy : policy.policy_name]
}
