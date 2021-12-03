resource "aws_security_group" "main" {
  description = "Manages access to the ${var.cluster_id} ElastiCache cluster."
  name        = "${var.cluster_id}-sg"
  tags        = merge(var.tags, { Name = "${var.cluster_id}-sg" })
  vpc_id      = var.vpc_id
}

resource "aws_security_group_rule" "egress" {
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 0
  protocol          = "-1"
  security_group_id = aws_security_group.main.id
  to_port           = 0
  type              = "egress"
}

resource "aws_security_group_rule" "ingress_cidr" {
  cidr_blocks       = var.allowed_cidrs[count.index]
  count             = length(var.allowed_cidrs)
  from_port         = var.port
  protocol          = "tcp"
  security_group_id = aws_security_group.main.id
  to_port           = var.port
  type              = "ingress"
}

resource "aws_security_group_rule" "ingress_sg" {
  count                    = length(var.allowed_security_groups)
  from_port                = var.port
  protocol                 = "tcp"
  security_group_id        = aws_security_group.main.id
  source_security_group_id = var.allowed_security_groups[count.index]
  to_port                  = var.port
  type                     = "ingress"
}
