resource "aws_lb" "k8s_nlb" {
    name = "kubernetes"
    load_balancer_type = "network"
    subnets = [var.subnet_id]
    internal  = false
}

resource "aws_lb_target_group" "nlb_target_group" {
  name        = "kubernetes"
  port        = 6443
  protocol    = "TCP"
  target_type = "ip"
  vpc_id      = var.vpc_id
}

resource "aws_lb_target_group_attachment" "nlb_target_group_att" {
    count = length(var.target_ips)
    target_group_arn = aws_lb_target_group.nlb_target_group.arn
    target_id   =  var.target_ips[count.index]
}

resource "aws_lb_listener" "nlb_listener" {
    load_balancer_arn = aws_lb.k8s_nlb.arn
    port = "433"
    protocol = "TCP"
    default_action {
        type             = "forward"
        target_group_arn = aws_lb_target_group.nlb_target_group.arn
    }
}

