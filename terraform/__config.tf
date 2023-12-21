terraform {
  backend "s3" {
    # don't set any values here (other than region)
    # we need to be using the same TF_CLI_ARGS_init as the workflows
    region = "eu-west-2"
  }

  required_version = "~> 1.4"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.6"
    }
  }
}

provider "aws" {
  alias  = "default"
  region = local.aws_default_region
  default_tags {
    tags = local.tag_defaults
  }
}

provider "aws" {
  alias  = "acm_provider"
  region = local.aws_acm_provider_region
  default_tags {
    tags = local.tag_defaults
  }
}
