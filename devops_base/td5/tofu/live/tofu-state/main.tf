provider "aws" {
  region = "eu-central-1"
}

module "state" {
  source = "../../modules/state-bucket"

  # TODO: fill in your own bucket name!
  name = "my-open-tofu-bucket-chenyi-cd"
}