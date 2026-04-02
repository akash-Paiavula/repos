module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "18.31.2"

  cluster_name    = "akash-eks"
  cluster_version = "1.29"

  vpc_id = "vpc-0c2bb06439d58d61b"

  subnet_ids = [
    "subnet-05caa42c8a06d1b31",
    "subnet-0caad4cb53f9cc258",
    "subnet-0d20b8e1e66e7be5f",
    "subnet-03800b07178452218",
    "subnet-09eee19fed047c15b",
  ]

  enable_irsa = true

 eks_managed_node_groups = {
  nodes = {
    desired_size = 2
    max_size     = 2
    min_size     = 1

    instance_types = ["t3.micro"]   # ✅ Free tier eligible
  }
}

  tags = {
    Environment = "dev"
  }
}