data "aws_caller_identity" "current-user" {}

output "current_user" {
  value = data.aws_caller_identity.current-user
}
output "account_id" {
  value = data.aws_caller_identity.current-user.account_id
}

output "user_id" {
  value = data.aws_caller_identity.current-user.user_id
}