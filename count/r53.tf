resource "aws_route53_record" "route53" {
count = 2
  zone_id = var.zone_id
  name    = "${var.instances[count.index]}.${var.domain_name}"
  type    = "A"
  ttl     = 1
  records = [aws_instance.my_ec2[count.index].private_ip]
}
