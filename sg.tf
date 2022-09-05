module "jenkins_sg" {
  source = "terraform-aws-modules/security-group/aws"

  name        = "jenkins-sg"
  description = "Security group para o Jenkins Server"
  vpc_id      = data.aws_vpc.catapimba_vpc.id

  ingress_cidr_blocks      = ["0.0.0.0/0"]
  ingress_rules            = ["http-80-tcp", "ssh-tcp"]
  egress_rules             = ["all-all"]  
}