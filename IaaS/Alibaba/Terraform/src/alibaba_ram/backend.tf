/** terraform {
  backend "oss" {
    bucket     = "thesorrow-terraform-state-bucket"
    key        = "iam/thesorrow/state_tf"
    region     = "oss-cn-hangzhou"
    endpoint   = "oss-cn-hangzhou.aliyuncs.com"
    #tablestore = "thesorrow-lock-file-datastore"
  }
} **/
