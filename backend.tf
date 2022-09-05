terraform {
  backend "s3" {
    bucket = "terraform-state-diego-castro"
    key    = "terraform-jenkins-catabimba.tfstate"
    region = "us-east-1"
  }
}