#Resource for Aravind's account


resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDYLJRpOFY6oqejmvL7y4OjXDXrHzNYh2ahXmsb5qWy6d/LQVMWqv2hCe7cAuliaQ5cnEelsYFkKQEGwmyOhyCL4NfX1XK7XxrWmWHwxbGRuV/NK8YKVWrRNft+uy2MpsJ0lGwsmFgtj0qKXejaR1tjgqch8umSfKZt8d+Ge7vceU0ahXkcK8sUH29DUXDOk/CPMJq3cjTuEyJLUKO7fWNl63cwP4d1JgLkqbhNc8MM9tCqXhsrqoH/omelcmMtkLYnAlDmRwi0hJJTeibLrYOpxBk9KT+yLLkyZrKrXDfjkUvO6CWmTWmM3zV1XQUVF9qER7ii+/mBVFk8xFaH0dYj aravind@aravind-MintBox"
}


resource "aws_instance" "jazz" {

  provider =  "aws.aravind"
  ami           = "ami-0a74bfeb190bd404f"
  instance_type = "t2.micro"
  key_name = "deployer-key"
 
  tags = {
   Name = "aravind"
     }
}



resource "aws_instance" "example" {
  #ami           = var.AMIS[var.AWS_REGION]
  ami           = "${lookup(var.AMIS, var.AWS_OS)}"
  instance_type = "t2.micro"  

}



resource "aws_iam_user" "iamuser_list" {
  count = "${length(var.names)}"
  name = "${var.names[count.index]}"
}


/*
resource "aws_iam_user" "example" {
  count = "${var.numofusers}"
  name  = "aravind${count.index}"
}
*/



/*
#Resource for Rajesh's account
resource "aws_instance" "jazz" {
  provider =  "aws.rajesh"
  ami           = "ami-5b673c34"
  instance_type = "t2.micro"
  key_name = "deployer-key"

 
  tags = {
   Name = "aravind"
     }
*/
/*
provisioner "local-exec" {
    command = "open WFH, '>completed.txt' and print WFH scalar localtime"
    interpreter = ["perl", "-e"]
}

provisioner "local-exec" {
    command = "echo 'How are you doing today?' >> /home/aravind/tf/rwprovisioner.txt"
}

provisioner "local-exec" {
    command = "echo ${aws_instance.jazz.private_ip} >> private_ips.txt"
}
provisioner "local-exec" {
    
    command = "echo ${aws_instance.jazz.arn} >> private_ips.txt"
}

*/
/*  provisioner "file" {
    source     = "/home/aravind/jazz"
    destination = "/tmp/file.log"

    connection {
    type     = "ssh"
    user     = "ec2-user"
    private_key = "${file("/home/aravind/.ssh/id_rsa")}"
    host     = "${self.public_ip}"
  }
}
*/

/*
provisioner "remote-exec" {
    inline = [
      "sudo yum install wget -y",
      "wget https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm",
      "sudo yum install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm -y",
      "sudo rpm -i epel-release-latest-7.noarch.rpm",
      "sudo yum-config-manager --enable \*",
      "sudo yum install ansible -y",
      "sudo yum install git -y",
      "git clone https://github.com/devops-school/ansible-hello-world-role /tmp/ans_ws",
      "ansible-playbook /tmp/ans_ws/site.yaml",
    ]

connection {
    type     = "ssh"
    user     = "ec2-user"
    private_key = "${file("/home/aravind/.ssh/id_rsa")}"
    host     = "${self.public_ip}"

  }
}
*/

/*
      provisioner "remote-exec" {
          inline = [
              "sudo yum install python3 -y",
              "pip3 install ansible --user",
              "sudo yum install git -y",
              "git clone https://github.com/devops-school/ansible-hello-world-role /tmp/ans_ws",
              "ansible-playbook /tmp/ans_ws/site.yaml"
          ]

      connection {
          type     = "ssh"
          user     = "ec2-user"
          private_key = "${file("/home/aravind/.ssh/id_rsa")}"
          host     = "${self.public_ip}"

        }
      }
      */



