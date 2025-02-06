locals {
  ## reserved for solution wide "stuff"

  string_upper = "TEST123"
  string_lower = "test"

  data_file = "${path.module}/data/sample1.json"
  file_data = jsondecode(file(local.data_file))

  data_file_set = fileset("${path.module}/data/", "*.json")
  file_set_data = {
    for samplefile in local.data_file_set : samplefile =>
    jsondecode(file("${path.module}/data/${samplefile}"))
  }

  vnetcidr = "10.10.10.0/23" ## Normally retrieved from IPAM
  cluster_cidr          = cidrsubnet(local.vnetcidr, 1, 0)
  private_endpoint_cidr = cidrsubnet(local.vnetcidr, 4, 8)
  agw_cidr              = cidrsubnet(local.vnetcidr, 4, 9)
  github_runners_cidr   = cidrsubnet(local.vnetcidr, 3, 5)


}





