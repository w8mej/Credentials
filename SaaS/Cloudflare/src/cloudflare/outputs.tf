output "account_id" {
  description = "the cloudflare account id."
  value       = cloudflare_account_member.account_id
}

output "email_address" {
  description = "The user's email address in cloudflare."
  value       = cloudflare_account_member.email_address
}

output "status" {
  description = "The user's activation state in cloudflare"
  value       = cloudflare_account_member.status
}

output "role_ids" {
  description = "The user's different cloudflare roles."
  value       = [for group in cloudflare_account_member.role_ids : group.role_ids]
}

