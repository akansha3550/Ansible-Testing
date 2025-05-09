aws_region           = "us-east-1"
vpc_cidr             = "10.10.0.0/16"
vpc_name             = "Ansible-Vpc"
key_name             = "myapp"
public_subnet_cidrs  = ["10.10.1.0/24", "10.10.2.0/24", "10.10.3.0/24"]    #List
private_subnet_cidrs = ["10.10.10.0/24", "10.10.20.0/24", "10.10.30.0/24"] #List
azs                  = ["us-east-1a", "us-east-1b", "us-east-1c"]          #List
environment          = "production"
instance_type = {
  development = "t2.micro"
  testing     = "t2.micro"
  production  = "t2.micro"
}
amis = {
  us-east-1 = "ami-084568db4383264d4" # Canonical, Ubuntu, 20.04 LTS, amd64 focal image
  us-east-2 = "ami-04f167a56786e4b09" # Canonical, Ubuntu, 20.04 LTS, amd64 focal image
}
projid    = "PHOENIX-123"
imagename = "ami-084568db4383264d4"
