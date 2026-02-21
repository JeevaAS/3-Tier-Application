output "cluster_name" {
  value = aws_eks_cluster.three_tier.name
}

output "ecr_frontend_url" {
  value = aws_ecr_repository.frontend_repo.repository_url
}

output "ecr_backend_url" {
  value = aws_ecr_repository.backend_repo.repository_url
}

output "subnets" {
  value = aws_subnet.public_subnet[*].id
}