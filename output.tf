##################OUTPUT_PUBLIC_IP###############


output "public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.prj2_web_instance[*].public_ip

}



#################INSATNCE_ID###################


output "instance_id" {
  value = aws_instance.prj2_web_instance[*].id
}


##############PUBLIC_SUBNET_ID##############


output "public_subnet_id" {
  value       = aws_subnet.prj2_pub_sub.id
  description = "The ID of the subnet."
}

##############PRIVATE_SUBNET_ID##############


output "private_subnet_id" {
  value       = aws_subnet.prj2_pvt_sub.id
  description = "The ID of the subnet."
}


####################WEB_SECURITY_GROUP_ID##########

output "security_group_ids" {
  value = aws_security_group.http-ssh.id
}
