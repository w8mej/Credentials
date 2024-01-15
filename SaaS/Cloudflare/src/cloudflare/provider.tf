provider cloudflare {
  source  = "cloudflare/cloudflare"
  api_token = var.api_token
  max_backoff = var.max_backoff
  min_backoff = var.min_backoff
  retries = var.retries
  rps = var.rps
}
