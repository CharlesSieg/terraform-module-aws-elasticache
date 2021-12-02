#
# Creates a Route53 CNAME entry pointing to the cluster.
# Cannot use A/AAAA because AWS does not manage aliases for ElastiCache.
#

resource "aws_route53_record" "cname" {
  allow_overwrite = true
  name            = "${var.environment}-cache"
  records         = [aws_elasticache_replication_group.redis.primary_endpoint_address]
  ttl             = 60
  type            = "CNAME"
  zone_id         = var.internal_dns_zone_id
}

