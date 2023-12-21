locals {
  app_name = "Park My Motorbike"
  app_slug = "park-my-motorbike"

  tag_defaults = {
    Owner   = "chisel"
    Name    = local.app_name
    Product = local.app_slug
    InfoURL = "https://github.com/chizmw/botc-custom-script-json2pdf"
    #Version    = data.external.useful_version_info.result.poetry_version
    ShaVersion = data.external.useful_version_info.result.commit_version
  }

  aws_default_region      = "eu-west-2"
  aws_acm_provider_region = "us-east-1"

}
