---
ansible_ssh_host: 192.168.127.211

if_ip: 192.168.127.71
if_mask: 255.255.255.0
if_gateway: 192.168.127.254
