output "arn" {
  description = "The ARN of the created ElastiCache Cluster."
  value       = aws_elasticache_cluster.main.arn
}

output "cache_nodes" {
  description = "List of node objects including id, address, port and availability_zone."
  value       = aws_elasticache_cluster.main.cache_nodes
}

output "cluster_address" {
  description = "DNS name of the cache cluster without the port appended."
  value       = aws_elasticache_cluster.main.cluster_address
}

output "configuration_endpoint" {
  description = "Configuration endpoint to allow host discovery."
  value       = aws_elasticache_cluster.main.configuration_endpoint
}

output "engine_version_actual" {
  description = "The running version of the cache engine."
  value       = aws_elasticache_cluster.main.engine_version_actual
}

output "security_group_id" {
  value = aws_security_group.main.id
}

output "subnet_group_name" {
  value = aws_elasticache_subnet_group.main.name
}

output "tags_all" {
  description = "Map of tags assigned to the resource."
  value       = aws_elasticache_cluster.main.tags_all
}
