#------------------------
#app
#registry for docker images of lambda functions
#------------------------
resource "aws_ecr_repository" "app" {
  name                 = local.app_name
  image_tag_mutability = "MUTABLE"
}