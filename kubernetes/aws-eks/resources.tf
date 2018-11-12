provider "aws" {
  region     = "eu-west-1"
}

module "eks" {
  source  		= "terraform-aws-modules/eks/aws"
  version 		= "1.7.0"
  
  tags          = {Environment = "poi-eks-env"}

  # insert the 3 required variables here
  cluster_name 	= "poi-eks-cluster"
  subnets 		= ["subnet-c11f05b6", "subnet-a850bce0", "subnet-8813e1ec", "subnet-a3685afa"]
  vpc_id 		= "vpc-3842495d"
  
  /*
  workers_group_defaults = {
    asg_desired_capacity          = "2"                             # Desired worker capacity in the autoscaling group.
    asg_max_size                  = "3"                             # Maximum worker capacity in the autoscaling group.
    asg_min_size                  = "1"                             # Minimum worker capacity in the autoscaling group.
    instance_type                 = "t2.medium"                     # Size of the workers instances.
  }
  */
  
  worker_groups         = [{
                            "asg_desired_capacity" = "3",
                            "asg_max_size" = "4",
                            "asg_min_size" = "1",
							              "instance_type"  = "t2.medium"
                          },
                          {
                            "asg_desired_capacity" = "2",
                            "asg_max_size" = "3",
                            "asg_min_size" = "1",
							              "instance_type"  = "t2.nano"
                          }
                        ]
}

/*
module "eks" {
  source                = "terraform-aws-modules/eks/aws"
  version               = "1.6.0"
  cluster_name          = "eks-dev-cluster"
  subnets               = ["subnet-PUBLIC", "subnet-PRIVATE"]
  tags                  = "${map("Environment", "Dev")}"
  vpc_id                = "vpc-VPC-ID"
  worker_groups         = [{
                            "asg_desired_capacity" = "3",
                            "asg_max_size" = "4",
                            "asg_min_size" = "1"
                          }]
}
*/