provider "aws" {
  region     = "eu-west-1"
}

module "eks" {
  source  		= "terraform-aws-modules/eks/aws"
  version 		= "1.7.0"
  
  tags          = {Environment = "poi-eks-env"}

  # insert the 3 required variables here
  cluster_name 	= "poi-eks-cluster"
  subnets 		= ["subnet-0f90d4b2597e54dc9", "subnet-093f483dc98504530", "subnet-037ac1c0e6a3ba2fb"]
  vpc_id 		= "vpc-0b6e66db6a32a37a8"
}
