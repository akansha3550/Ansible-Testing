data "aws_vpc" "ansible_vpc" {
  id = "vpc-00edce9174b48aefd"
}

data "aws_route_table" "ansible_vpc_rt" {
  # subnet_id = "subnet-00e784c9d98f52559"
  #If subnet_id giving errors use route table id as below
  route_table_id = "rtb-046dc7baed57b3fe5"
}

resource "aws_vpc_peering_connection" "ansible-vpc-peering" {
  peer_vpc_id = data.aws_vpc.ansible_vpc.id
  vpc_id      = aws_vpc.default.id
  auto_accept = true
  accepter {
    allow_remote_vpc_dns_resolution = true
  }

  requester {
    allow_remote_vpc_dns_resolution = true
  }

  tags = {
    Name = "Ansible-${var.vpc_name}-Peering"
  }
}

resource "aws_route" "peering-to-ansible-vpc" {
  route_table_id            = aws_route_table.terraform-public.id
  destination_cidr_block    = "172.31.0.0/16"
  vpc_peering_connection_id = aws_vpc_peering_connection.ansible-vpc-peering.id
  #depends_on                = [aws_route_table.terraform-public]
}

resource "aws_route" "peering-from-ansible-vpc" {
  route_table_id            = data.aws_route_table.ansible_vpc_rt.id
  destination_cidr_block    = "10.10.0.0/16"
  vpc_peering_connection_id = aws_vpc_peering_connection.ansible-vpc-peering.id
  #depends_on                = [aws_route_table.terraform-public]
}