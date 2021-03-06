# CS_Project_1
## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

![TODO: Update the path with the name of your diagram](https://github.com/aesco1304/CS_Project_1/blob/main/Diagrams%20and%20Images/ELK%20Stack%20Network%20Project%201.PNG)

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to recreate the entire deployment pictured above or the individual yoml files may be used to install only certain pieces of it, such as Filebeat.

  - [Install-elk.yml](https://github.com/aesco1304/CS_Project_1/blob/main/Ansible/install-elk.yml)
  - [filebeat-playbook.yml](https://github.com/aesco1304/CS_Project_1/blob/main/Ansible/filebeat-playbook.yml)
  - [metricbeat-playbook.yml](https://github.com/aesco1304/CS_Project_1/blob/main/Ansible/metricbeat-playbook.yml)

This document contains the following details:
- Description of the Topologu
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly available, in addition to restricting access to the network.

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the logs and system performance.

The configuration details of each machine may be found below.

| Name     | Function  | IP Address | Operating System |
|----------|-----------|------------|------------------|
| Jump Box | Gateway   | 10.0.0.4   | Linux            |
| Web-1    | DVWA      | 10.0.0.5   | Linux            |
| Web-2    | DVWA      | 10.0.0.6   | Linux            |
| ELK-VM   | ELK Stack | 10.1.0.4   | Linux            |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the Jump Box machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
- My home IP address.

Machines within the network can only be accessed by the Jump Box VM.

A summary of the access policies in place can be found in the table below.

| Name     | Publicly Accessible | Allowed IP Addresses                     |
|----------|---------------------|------------------------------------------|
| Jump Box | No                  | Home IP, Port 22                         |
| Web-1    | No                  | Home IP, Port 80 and 10.0.0.4, Port 22   |
| Web-2    | No                  | Home IP, Port 80 and 10.0.0.4, Port 22   |
| ELK-VM   | No                  | Home IP, Port 5601 and 10.0.0.4, Port 22 |

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because our configuration has made it so we don't have to manually access the ELK machine to make changes. This reduces the manpower and time required to operate and monitor these machines along with making errors less-likely. Once things have been configured correctly once, they will be configured the same way going forward.

The playbook implements the following tasks:
1) Install docker.io
2) Install python3-pip
3) Install docker module for python
4) Download and launch a docker ELK container
   a. Include published ports 5601, 9200, and 5044.
5) Enable docker service on start

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

![TODO: Update the path with the name of your screenshot of docker ps output](https://github.com/aesco1304/CS_Project_1/blob/main/Diagrams%20and%20Images/Screenshot%201%20-%20ELK%20Running.PNG)

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
- 10.0.0.5
- 10.0.0.6

We have installed the following Beats on these machines:
- Filebeat
- Metricbeat

These Beats allow us to collect the following information from each machine:
- Filebeat monitors log files and collects log events to determine activity on the web servers, such as connections that have taken place to the server.
- Metricbeat collects information from the operating system and services running on the service, such as CPU and memory usage.

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the [install-elk.yml](https://github.com/aesco1304/CS_Project_1/blob/main/Ansible/install-elk.yml) file to 'etc/ansible/'.
- Update the [hosts.yml](https://github.com/aesco1304/CS_Project_1/blob/main/Ansible/hosts.yml) file to include the appropriate private IP addresses for the Web VM's and ELK VM. Include 'ansible_python_interpreter=/usr/bin/python3' after each IP address.
- Here's an example of a completed hosts file: [hosts_completed.yml](https://github.com/aesco1304/CS_Project_1/blob/main/Ansible/hosts_completed.yml)
- Run the playbook, and navigate to http://[your.ELK-VM.External.IP]:5601/app/kibana to check that the installation worked as expected.
  - For example, with my ELK-VM, I would navigate to http://13.66.159.33:5601/app/kibana to confirm my installation worked.
