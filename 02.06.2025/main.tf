locals {
  ## reserved for solution wide "stuff"

  string_upper = "TEST"
  string_lower = "test"

  data_file = "${path.module}/data/sample.json"
  file_data = jsondecode(file(local.data_file))

  data_file_set = fileset("${path.module}/data/", "*.json")
  file_set_data = {
    for samplefile in local.data_file_set : samplefile =>
    jsondecode(file("${path.module}/data/${samplefile}"))
  }
}

