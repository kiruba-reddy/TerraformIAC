# TerraformIAC
Terraform file to create a file using template(.tpl) file and passing ssh private and public key values to the file to be created
tls_private_key -----------> resource to create ssh keys
local_file -----------------> resoure to create local file
templatefile("path/to/.tpl/file" ,{variable1=requiredvalue,variable2=requiredvale...})
