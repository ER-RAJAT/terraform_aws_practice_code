variable vpc_azs {
  type        = list(string)
  default     = ["us-east-1a","us-east-1b"]
  description = "AZs for VPC"
}
