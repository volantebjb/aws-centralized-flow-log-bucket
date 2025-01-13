variable "bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
}

variable "additional_tags" {
  description = "Additional tags for the S3 bucket"
  type        = map(string)
  default     = {}
}

variable "lifecycle_duration" {
  description = "The number of days before objects in the S3 bucket are transitioned or expired"
  type        = number
  default     = null
}

variable "default_lifecycle_duration" {
  description = "The default number of days before objects in the S3 bucket are transitioned or expired"
  type        = number
  default     = 7300
}

variable "private_lifecycle_duration" {
  description = "The number of days before private objects in the S3 bucket are transitioned or expired"
  type        = number
  default     = 365
}

variable "pii_lifecycle_duration" {
  description = "The number of days before PII (Personally Identifiable Information) objects in the S3 bucket are transitioned or expired"
  type        = number
  default     = 750
}

