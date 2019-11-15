# ansible-debian-initset
Basic network setup after installation for Debian hosts

This playbook performs basic settings to Debian hosts (in my case, Debian Buster), Used immediately after an automatic network installation.

## Playbook does the following
- adds ssh key to authorized keys
- renames host
- configures the static IP address of the interface
- edits the file _/etc/hosts_
- edits the file _/etc/resolv.conf_
- replaces ansible_ssh_host in _host_vars/\<host inventory\>_
- reboots the host
- waiting for a host to load with a new IP address

# How to run
1. Only the future fqdn should be specified in the ___inventory___ file, for example, kub1.ex.com.

2. In the ___host_vars/kub1.ex.com___ file, you must specify the variables, as in the example below.

    `ansible_ssh_host: 192.168.127.211`<br>
    `if_ip: 192.168.127.71`<br>
    `if__mask: 255.255.255.0`<br>
    `if_gateway: 192.168.127.254`<br>

    ansible_ssh_host - current host address obtained by DHCP.
    if_* variables will be used in host settings.

3. Dns-servers must be specified in ___roles/debian_initset/files/resolv.conf___.

4. the password for the ssh user must be specified in the ___group_vars/debian_initset___ file. You can specify plain text.<br>
In my example, password 123321 is encrypted by the command<br>
`ansible-vault encrypt_string 123321 --name ansible_ssh_pass --vault-password-file passwords/debian_initset`<br>
and then pasted into _group_vars/debian_initset_.

5. Finally, the playbook should be run by the command<br>
`ansible-playbook playbooks/debian_initset.yml --vault-password-file passwords/debian_initset`<br>
or<br>
`ansible-playbook playbooks/debian_initset.yml`<br>
when the password is plain text.
