resource "aws_instance" "web" {
  ami           = "ami-051f8a213df8bc089"
  subnet_id     = "subnet-0195b0bbac43262f9"
  instance_type = "t2.micro"
  tags = {
    Name = "Sam_test"
  }
}


resource "aws_instance" "web1" {
  ami           = "ami-0fe630eb857a6ec83"
  subnet_id     = "subnet-0195b0bbac43262f9"
  instance_type = "t2.micro"
  tags = {
    Name = "MSI2"
  }
}
resource "aws_lb" "Muleb2" {
  name               = "Muleb2-lb-tf"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.lb_sg.id]
  subnets            = ["subnet-0195b0bbac43262f9",""]



  enable_deletion_protection = true

  access_logs {
    bucket  = aws_s3_bucket.lb_logs.id
    prefix  = "test-lb"
    enabled = true
  }

  tags = {
    Environment = "production"
  }
}

# resource "aws_vpc" "main" {
#   cidr_block       = "10.0.0.0/16"
#   instance_tenancy = "default"
#   tags = {
#     Name = "main"
#   }
# }

# resource "aws_subnet" "main" {
#   vpc_id     = aws_vpc.main.id
#   cidr_block = "10.0.1.0/24"
#   tags = {
#     Name = "Main"
#   }
# }
