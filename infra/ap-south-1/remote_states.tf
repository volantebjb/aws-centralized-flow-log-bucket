data "terraform_remote_state" "vpc_flow_log" {
  backend = "local"
  config = {
    path = "../ap-southeast-1/terraform.tfstate"
  }
}