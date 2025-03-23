variable "default_tags" {
  description = "Tags padrão para identificar recursos na AWS"
  type        = map(string)
  default = {
    Project   = "mazyfood"
    ManagedBy = "Terraform"
  }
}

variable "region" {
  type    = string
  default = "us-east-1"
}

variable "project" {
  type    = string
  default = "mazyfood"
}

variable "iam_role_arn" {
  type = string
}