output "bucket_id" {
  value = aws_s3_bucket.bucket.id
}

output "bucket_arn" {
  value = aws_s3_bucket.bucket.arn
}

output "default_policy" {
  value = data.aws_iam_policy_document.default_policy
}