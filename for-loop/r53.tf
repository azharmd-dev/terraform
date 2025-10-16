resource "aws_route53_record" "route53" {
    
    for_each = aws_instance.my_ec2
    zone_id = var.zone_id
    name    = "${each.key}.${var.domain_name}"
    type    = "A"
    ttl     = 1
    records = [each.value.private_ip]
    allow_overwrite = true

# provisioner "local-exec" {
#   command = "echo ${self.name} ${join(",", tolist(self.records))} >> inventory"
#   on_failure = continue
# }
}
