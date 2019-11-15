---
ansible_ssh_host: 192.168.127.213

if_ip: 192.168.127.73
if_mask: 255.255.255.0
if_gateway: 192.168.127.254
