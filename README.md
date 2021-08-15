# cyber-wk13-repo
This is a quick little repository made for the USYD Cybersecurity course, demonstrating some of the content learnt.

---

## Linux
During the first couple of weeks we were taught how to use the Bash Shell language to create scripts. The two examples I've included are the 'for' loop scripts and another script which we were tasked to create that could search through text files for certain information.

The 'for' loops are quite simple, going along the lines of
```bash
states=('arkansas' 'texas' 'california' 'indiana' 'hawaii')

for state in ${states[@]}
do
  if [ $state = 'hawaii' ]
  then
    echo "I love $state!"
  else
    echo "Im not fond of $state."
  fi
done
```

The other script we were tasked to create is a bit different. It was a script that searched through a certain file for specific bits of information, where the file could be typed in because variables were used.

```bash
awk -F" " '{print $1,$2,$5,$6}' ./$1_Dealer_schedule | grep $2 | grep $3
```

Where a date is inputted for *$1_Dealer_schedule*, a time is inputted for *$2* and AM/PM is input into *$3*. The script does, however, need the proper text files for it to work correctly.

---

## Diagrams

![Network Diagram](./diagrams/NetworkDiagram.png)
We studied briefly on how to create network diagrams, just to get a basic understanding of how to visualise a network if needed by an employer.

---

## Ansible
The latest unit we covered was how to set up Docker Containers and create Ansible playbooks to set up our virtual machines.

The way we created the playbooks was partly through our own research and partly through a demonstration that our instructor did.
Here's an example of one of the playbooks:
```bash
- name: Configure VM with Docker
  hosts: webservers
  become: true
  tasks:
  - name: Install docker.io
    apt:
      update_cache: yes
      name: docker.io
      state: present

  - name: Install pip3
    apt:
      name: python3-pip
      state: present

  - name: Install Docker Python Module
    pip:
      name: docker
      state: present

  - name: Pull Docker web container
    docker_container:
      name: dvwa
      image: cyberxsecurity/dvwa
      state: started
      restart_policy: always
      published_ports: 80:80

  - name: Enable docker service
    systemd:
      name: docker
      enabled: yes
```
