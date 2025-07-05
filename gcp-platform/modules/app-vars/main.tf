


resource "null_resource" "example1" {}

resource "local_file" "example2" {
  content = "Terraform learning file"
  filename = "${path.module}/testfile"

} 


}
