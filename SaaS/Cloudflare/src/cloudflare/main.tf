resource "cloudflare_account_member" "infosec" {
    account_id    = var.account_id
    user_email    = var.user_email
    status        = var.status
    role_ids      = var.role_ids
}