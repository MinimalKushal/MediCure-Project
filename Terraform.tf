provider "aws" {
  region = "us-east-1"
  access_key = "AKIAWYYXEWHSWUPVABME"
  secret_key = "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"
}

resource "aws_instance" "Medicure-Deploy" {
  ami           = "ami-007855ac798b5175e" 
  instance_type = "t2.micro" 
  key_name = "Kushal"
  vpc_security_group_ids= ["sg-0b23fc55ea213e3a1"]
  connection {
    type     = "ssh"
    user     = "ubuntu"
    private_key = file("Kushal.pem")
    host     = self.public_ip
  }
  provisioner "remote-exec" {
    inline = [ "echo 'wait to start instance' "]
  }
  tags = {
    Name = "Finance Me Deploy"
  }
  provisioner "local-exec" {
        command = " echo ${aws_instance.Finance-Me-Deploy.public_ip} >> inventory.txt "
  }
   provisioner "local-exec" {
  command = "ansible-playbook /var/lib/jenkins/workspace/FinanceMeProject/Playbook.yml "
  } 
}