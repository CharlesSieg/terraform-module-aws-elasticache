resource "aws_elasticache_parameter_group" "main" {
  count       = length(var.parameters) > 0 ? 1 : 0
  description = ""
  family      = "memcached${replace(var.engine_version, "/\\.[\\d]+$/", "")}" # Strip the patch version from redis_version var
  name        = "${var.environment}-${var.name}"

  dynamic "parameter" {
    for_each = var.parameters
    content {
      name  = parameter.value.name
      value = parameter.value.value
    }
  }

  lifecycle {
    create_before_destroy = false
  }
}

resource "aws_elasticache_subnet_group" "main" {
  name       = "${var.environment}-${var.app_name}"
  subnet_ids = var.subnet_ids
}

resource "aws_elasticache_cluster" "main" {
  apply_immediately            = var.apply_immediately
  availability_zone            = var.availability_zone
  az_mode                      = var.az_mode
  cluster_id                   = var.cluster_id
  engine                       = "memcached"
  engine_version               = var.engine_version
  maintenance_window           = var.maintenance_window
  node_type                    = var.node_type
  notification_topic_arn       = var.notification_topic_arn
  num_cache_nodes              = var.num_cache_nodes
  parameter_group_name         = length(var.parameters) > 0 ? aws_elasticache_parameter_group.main.name : var.parameter_group_name
  port                         = var.port
  preferred_availability_zones = var.preferred_availability_zones
  security_group_ids           = [module.aws_security_group.id]
  subnet_group_name            = module.aws_elasticache_subnet_group.main.name
  tags = merge(var.tags, {
    name = "foo"
  })
}

