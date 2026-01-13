Modules

ansible localhost -m ping

ansible all -m file -a "path=/home/smunoz/adhoc1 state=touch mode=700"
ansible all -m file -a "path=/home/smunoz/adhoc1 state=absent"
ansible all -m copy -a "src=/tmp/adhoc2 dest=/home/smunoz/adhoc2"

ansible all -m yum -a "name=telnet state=present"
ansible all -m yum -a "name=httpd-manual state=present"

ansible all -m service -a "name=httpd state=started"
ansible all -m service -a "name=httpd state=started enable=yes"

ansible all -m shell -a "name=httpd state=absent"

ansible all -m yum -a "name=httpd state=absent"
ansible all -m shell -a "yum remove httpd"

ansible all -m user -a "name=jsmith home=/home/jsmith shell=/bin/bash state=present"
ansible all -m user -a "name=jsmith home=/home/jsmith group=smunoz"

ansible all -m user -a "name=jsmith home=/home/jsmith shell=/bin/bash state=absent"
ansible all -m shell -a "userdel jsmith"

ansible all -m setup

ansible client1 -a "/sbin/reboot"


Roles

Roles simplifies long playbooks by grouping tasks into smaller playbooks

The role are the way of breaking a playbook into multiple playbook files. This simplifies writing complex playbooks, and it makes them easier to reuse.

Writing ansible code to manage the same service for multiple environments creates more complexity and it becomes difficult to manage everything in one ansible playbook.
Also sharing code among other teams become difficult. That is where Ansible Role helps solve these problems.

Roles are like templates that are most of the time static and can be called by the playbooks

Roles allow the entire configuration to be grouped in:
Tasks
Modules
Variables
Handlers


A httpd installation playbook to webservers-east = role "fullinstall" for example
A playbook to install basic httpd in others webservers = role "basicinstall" for example

---
- name: "Full install"
  hosts: east-webservers
  roles:
  - fullinstall

- name: "Basic install"
  hosts: west-webservers
  roles:
  - basicinstall

To create roles:
Go to /etc/ansible/roles

Make a directory for each roles

basicinstall/tasks
fullinstall/tasks

Create sub-directory tasks within each directory

basicinstall/tasks/main.yaml
fullinstall/tasks/main.yaml


Roles by Application


Go to /etc/ansible/roles

Make a directory for each app

Create sub-directory tasks within each directory

apache/tasks/main.yaml
ntpd/tasks/main.yaml
named/tasks/main.yaml


---
- name: "Install packages"
  hosts: all
  roles:
  - apache
  - ntpd
  - named


Roles in Ansible Galaxy

You can find a ton of resources on roles in Ansible Galaxy
You can download pre-defined roles.

To install a role you can run: ansible-galaxy install


Tags

References or aliases to a tasks

---
- name: "Test playbook"
  hosts:
  tasks:
  - name: "Task1"
    yum:
      name: httpd
      state: present
      tags: i-httpd

  - name: "Task2"
    yum:
      name: httpd
      state: present
      tags: s-httpd


ansible-playbook httpdbytags.yaml -t i-httpd
ansible-playbook httpdbytags.yaml -t s-httpd
ansible-playbook httpdbytags.yaml --skip-tags i-httpd


We can use tasks option to start a playbook at a specific task

ansible-playbook yamlfile.yaml --start-at-task 'Task name'
ansible-playbook http.yaml --start-at-task 'Install httpd'


Variables

To install "httpd" and reload it we can use "{{ apache }}" for example
apache = httpd or apache2

other example is a location

vars:
  srcfiles: /home/smunoz/copy



Variables in Inventory file:

[webservers:vars]
fooserver=foo.abc.example.com
ntpserver=ntp.abc.example.com
proxyserver=proxy.abc.example.com

server1 ansible_host=201.0.113.111
server2 ansible_host=201.0.113.112
server3 ansible_host=201.0.113.113



Handlers


Execute this tasks if there was a change. Only run when notified. Each handler should have a globally unique name.
Usually we use handlers to start, reload, restart and stop services.

The last action of a task with:

notify: (the same indedation that name)
- Restart Apache


(the last piece of the playbook)
handlers:
  - name: Restart Apache
    service:
      name: httpd
      state: restarted



Conditions

We can add "when" at the same indedation than the task name.

tasks:
  - name: "Install Apache on Ubuntu Server"
    apt-get:
      name: apache2
      state: present
    when: ANSIBLE_OS_FAMILY == "Ubuntu"

  - name: "Install Apache on CentOS Server"
    yum:
      name: httpd
      state: present
    when: ANSIBLE_OS_FAMILY == "RedHat"


Loops

  tasks:
  - name: "Install Apache on Ubuntu Server"
    user:
      name: ""{{ item }}""
      state: present
    loop:
	- terry
	- jerry
	- tom



---
  - name: "Install Apache on Ubuntu Server"
    hosts: all
    vars:
      users: [terry,jerry,tom]

  tasks:
  - name: "Install Apache on Ubuntu Server"
    user:
      name: '{{item}}'
    with_items: '{{users}}'




Ansible Vault

ansible-playbook httpbyvault.yaml --ask-vault-pass

ansible-vault create httpbyvault.yaml

ansible-vault view httpbyvault.yaml

ansible-vault edit httpdbyvault.yaml


ansible-vault encrypt_string httpd
ansible-vault create/encrypt outputbystring.yaml

---
- name: Test encrypted output
  hosts: all
  vars:
	secret: !vault |
                $ANSIBLE_VAULT;1.1;AES256
		1233333333333333333333333333333331234234123423511235213
		2342342354234523453245345345345345235423424234234234234
		234234234
  tasks:
	- name: Print encrypted string
	  debug:
		var: secret












