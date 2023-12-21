
data "external" "useful_version_info" {
  program = ["bash", "${path.module}/get-useful-information"]
}
