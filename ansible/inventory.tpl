
[webservers]

${vm_ips}



[webservers:vars]

ansible_user=azureuser

ansible_ssh_private_key_file=~/.ssh/ansible_lab_key

ansible_ssh_common_args=-o StrictHostKeyChecking=no

