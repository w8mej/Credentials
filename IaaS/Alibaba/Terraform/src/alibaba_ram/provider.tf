## Setup the associated environment variables
# export ALICLOUD_ACCESS_KEY="anaccesskey"
# export ALICLOUD_SECRET_KEY="asecretkey"
# export ALICLOUD_REGION="cn-beijing"
#provider "alicloud" {}

# or use this corporate style
provider "alicloud" {
  region                  = "cn-hangzhou"
  shared_credentials_file = "~/vault_temp_shadow_mount/.aliyun/creds"
  profile                 = "thesorrowprofile"
}

# or side car approach
#provider "alicloud" {
#  assume_role {
#    role_arn           = "acs:ram::ACCOUNT_ID:role/ROLE_NAME"
#    policy             = "POLICY"
#    session_name       = "SESSION_NAME"
#    session_expiration = 999
#  }
#}