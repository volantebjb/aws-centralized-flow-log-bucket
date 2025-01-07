resource "aws_s3_bucket" "bucket" {
  bucket = var.bucket_name
  tags = merge(
    { Name = var.bucket_name },
    var.additional_tags
  )
}

resource "aws_s3_bucket_lifecycle_configuration" "bucket_lifecycle" {
  bucket = aws_s3_bucket.bucket.bucket

  rule {
    id     = "lifecycle-rule"
    status = "Enabled"

    filter {
      prefix = ""
    }

    expiration {
      days = var.lifecycle_duration != null ? var.lifecycle_duration : (
        var.additional_tags["PUBLIC"] == "N" && var.additional_tags["PII"] == "N" ? var.private_lifecycle_duration :
        var.additional_tags["PUBLIC"] == "N" && var.additional_tags["PII"] == "Y" ? var.pii_lifecycle_duration :
        var.default_lifecycle_duration
      )
    }
  }
}
