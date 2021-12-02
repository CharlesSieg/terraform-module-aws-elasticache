resource "aws_security_group" "main" {
  description = ""
  name        = ""
  vpc_id      = data.aws_vpc.vpc.id

  tags = {
    Name = "tf-sg-ec-${var.name}-${var.environment}-${data.aws_vpc.vpc.tags["Name"]}"
  }
}

resource "aws_security_group_rule" "ingress" {
  from_port                = var.port
  protocol                 = "tcp"
  security_group_id        = aws_security_group.redis_security_group.id
  source_security_group_id = var.allowed_security_group
  to_port                  = var.port
  type                     = "ingress"
}

resource "aws_security_group_rule" "redis_networks_ingress" {
  cidr_blocks       = var.allowed_cidr
  from_port         = var.port
  protocol          = "tcp"
  security_group_id = aws_security_group.redis_security_group.id
  to_port           = var.port
  type              = "ingress"
}
