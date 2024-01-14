resource "alicloud_ram_user" "thesorrow" {
  name        = var.ram_user_name
  display_name = var.ram_user_display_name
  mobile       = var.ram_user_mobile
  email        = var.ram_user_email
  comments     = var.ram_user_comments
  force        = true
}

resource "alicloud_ram_access_key" "thesorrow_key" {
  user_name = alicloud_ram_user.thesorrow.name
  pgp_key   = var.ram_user_pgp
}



resource "alicloud_ram_group_membership" "thesorrow_group_membership" {
  for_each  = toset(var.ram_user_groups)
  user_names = alicloud_ram_user.thesorrow.name
  group_name = each.value
}

resource "alicloud_ram_user_policy_attachment" "thesorrow_policy" {
  for_each   = toset(var.ram_user_policies) 
  policy_name = each.value
  policy_type = "Custom"
  user_name   = alicloud_ram_user.thesorrow.name
}
