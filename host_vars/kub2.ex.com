---
ansible_ssh_host: 192.168.127.212

if_ip: 192.168.127.72
if_mask: 255.255.255.0
if_gateway: 192.168.127.254
