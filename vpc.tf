#vpc_module

resource "aws_vpc" "prj2_terraform" {

  cidr_block = "10.0.0.0/16"

  instance_tenancy = "default"

  tags = {

    Name = "PRJ2"

  }
}
