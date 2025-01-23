locals {
  ## --------------------------------------------------------------------------------------------------------
  ## File Content
  ## --------------------------------------------------------------------------------------------------------
  singlelinecontent = "Hello world!"
  multilinecontent  = <<EOF
This is multi-line content.
... no it's not!
Well, that wasn't, but now this is.
EOF


  ## --------------------------------------------------------------------------------------------------------
  ## Files and Folders
  ## --------------------------------------------------------------------------------------------------------

  filename   = "File1.txt"
  foldername = "Folder1"
  filepath   = "${path.module}/example_output/${local.foldername}/${local.filename}"

  filecollection = {
    "Folder2" = ["File1.txt", "File2.txt"],
    "Folder3" = ["FileA.txt", "FileB.txt"]
  }

  folderedfiles = flatten([
    for folder_key, folder in local.filecollection : [
      for file_key in folder : {
        folder_key = folder_key
        file_key   = file_key
      }
    ]
  ])
}



resource "local_file" "local__filepath" {
  content  = local.singlelinecontent
  filename = local.filepath
}

resource "local_file" "local__foldered_files" {
  for_each = tomap({
    for folder in local.folderedfiles : "${folder.folder_key}.${folder.file_key}" => folder
  })

  content  = local.multilinecontent
  filename = "${path.module}/example_output/${each.value.folder_key}/${each.value.file_key}"
}
