resource "aws_eks_access_entry" "student_user" {
  cluster_name  = module.eks.cluster_name
  principal_arn = "arn:aws:iam::985539760939:user/demo-admin"
  type          = "STANDARD"
}

resource "aws_eks_access_policy_association" "student_user_admin" {
  cluster_name  = module.eks.cluster_name
  policy_arn    = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"
  principal_arn = aws_eks_access_entry.student_user.principal_arn
  access_scope {
    type = "cluster"
  }
}


