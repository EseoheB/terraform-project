locals {
  project_name = "Rapid-Project"
  project_tags = {
    Team = "Rapid DevOps Team"
    Contact = "devops@Rapid.com"
    App = "Web Infrastructure"
    CreationTime = formatdate("DD MMM YYYY hh:mm ZZZ", timestamp())
  }
  ec2_public_ip = false
  env = "${terraform.workspace}"
}