#------------------------
#mail
#topic to allow sending emails
#------------------------
module "mail" {
  source       = "github.com/simoferr98/terraform-aws-sns"
  name         = local.mail_name
  display_name = local.mail_name
}