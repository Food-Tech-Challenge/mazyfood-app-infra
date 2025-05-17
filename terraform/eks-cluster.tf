module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "19.0.4"

  cluster_name    = local.cluster_name
  cluster_version = "1.32"

  vpc_id                         = module.vpc.vpc_id
  subnet_ids                     = module.vpc.private_subnets
  cluster_endpoint_public_access = true

  create_iam_role = false
  enable_irsa     = false

  iam_role_arn = data.aws_iam_role.lab_role.arn

  eks_managed_node_group_defaults = {
    ami_type        = "AL2_x86_64"
    create_iam_role = false
    iam_role_arn    = data.aws_iam_role.lab_role.arn
  }

  eks_managed_node_groups = {
    one = {
      name = "node-group-1"

      instance_types = ["t3.small"]

      min_size     = 1
      max_size     = 2
      desired_size = 1
    }
  }

  cluster_encryption_config = []

  tags = merge(
    var.default_tags,
    {
      Name = local.cluster_name
    }
  )
}