output "vpc_public_subnets" {
  value       = module.vpc.public_subnets
  sensitive   = true
  description = "description"
  depends_on  = []
}
