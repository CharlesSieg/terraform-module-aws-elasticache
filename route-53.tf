#
# Creates a Route 53 CNAME entry pointing to the cluster.
# Cannot use A/AAAA because AWS does not manage aliases for ElastiCache.
#

resource "aws_route53_record" "cname" {
  allow_overwrite = true
  count           = var.zone_id == null ? 0 : 1
  name            = "${var.cluster_id}.${var.domain_name}"
  records         = [aws_elasticache_cluster.main.cluster_address]
  ttl             = 60
  type            = "CNAME"
  zone_id         = var.zone_id
}
