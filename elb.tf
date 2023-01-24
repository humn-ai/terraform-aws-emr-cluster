resource "aws_security_group" "alb" {
  count       = var.alb_enabled ? 1 : 0
  description = "Controls access to the ${var.use_wrong_loadbalancer_name ? "" : "Kylin"} ALB (HTTP/HTTPS)"
  vpc_id      = var.vpc_id
  name        = module.label_alb.id
  tags        = module.label_alb.tags
}

resource "aws_security_group_rule" "alb_egress" {
  count             = var.alb_enabled ? 1 : 0
  type              = "egress"
  from_port         = "0"
  to_port           = "0"
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.alb[0].id
}

resource "aws_security_group_rule" "alb_http_ingress" {
  count             = var.alb_enabled && var.alb_allow_http_access ? 1 : 0
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  prefix_list_ids   = []
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.alb[0].id
}

resource "aws_security_group_rule" "alb_https_ingress" {
  count             = var.alb_enabled && var.alb_allow_https_access ? 1 : 0
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  prefix_list_ids   = []
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.alb[0].id
}

resource "aws_lb" "default" {
  count              = var.alb_enabled ? 1 : 0
  name               = module.label_alb.id
  tags               = module.label_alb.tags
  internal           = var.alb_internal
  load_balancer_type = "application"

  security_groups = compact([aws_security_group.alb[0].id])

  subnets                          = var.subnet_ids
  enable_cross_zone_load_balancing = true
  enable_http2                     = true
  idle_timeout                     = 60
  ip_address_type                  = "ipv4"
  enable_deletion_protection       = false
}

resource "aws_route53_record" "default" {
  count   = var.alb_enabled ? 1 : 0
  zone_id = var.zone_id
  name    = var.master_dns_name
  type    = "A"

  alias {
    name                   = aws_lb.default[0].dns_name
    zone_id                = aws_lb.default[0].zone_id
    evaluate_target_health = true
  }
}

resource "aws_lb_target_group" "default" {
  count                = var.alb_enabled ? 1 : 0
  name                 = module.label_alb.id
  port                 = var.alb_target_group_port
  protocol             = var.alb_target_group_protocol
  vpc_id               = var.vpc_id
  target_type          = var.alb_target_group_target_type
  deregistration_delay = 15

  health_check {
    protocol            = var.alb_target_group_protocol
    path                = "/"
    timeout             = 10
    healthy_threshold   = 2
    unhealthy_threshold = 2
    interval            = 15
    matcher             = "200-399"
  }

  stickiness {
    enabled = false
    type    = "lb_cookie"
  }

  lifecycle {
    create_before_destroy = true
  }

  tags = merge(
    module.label_alb.tags
  )
}

resource "aws_lb_target_group_attachment" "default" {
  count            = var.alb_enabled && var.master_instance_group_instance_count > 0 ? var.master_instance_group_instance_count : 0
  target_group_arn = aws_lb_target_group.default[0].arn
  target_id        = element(data.aws_instances.emr_master_instances.ids, count.index)
  port             = var.alb_target_group_port

  depends_on = [
    data.aws_instances.emr_master_instances,
    aws_emr_cluster.default
  ]
}

resource "aws_lb_listener" "http_redirect" {
  count             = var.alb_enabled && var.alb_allow_http_access ? 1 : 0
  load_balancer_arn = aws_lb.default[0].arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    target_group_arn = aws_lb_target_group.default[0].arn
    type             = "redirect"

    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }
}

resource "aws_lb_listener" "https" {
  count             = var.alb_enabled && var.alb_allow_https_access ? 1 : 0
  load_balancer_arn = aws_lb.default[0].arn

  port            = 443
  protocol        = "HTTPS"
  ssl_policy      = "ELBSecurityPolicy-2015-05"
  certificate_arn = var.certificate_arn

  default_action {
    target_group_arn = aws_lb_target_group.default[0].arn
    type             = "forward"
  }
}
