module "jenkins_ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  name                      = "Jenkins-Server"
  ami                       = data.aws_ami.amazon_linux.id
  instance_type             = "t2.micro"
  key_name                  = "vockey"
  monitoring                = true
  vpc_security_group_ids    = [module.jenkins_sg.security_group_id]
  subnet_id                 = "subnet-041eef4014f0b4116"
  iam_instance_profile      = "LabInstanceProfile"
  user_data		            = file("./dependencias.sh")

  tags = {
    Terraform = "true"
  }
}

resource "aws_eip" "jenkins_ip" {
  instance = module.jenkins_ec2_instance.id
  vpc      = true
}