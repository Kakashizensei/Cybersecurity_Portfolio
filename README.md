## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

![Network Image](https://github.com/Kakashizensei/Cybersecurity_Portfolio/blob/main/Diagrams/Azure_Cloud_Network.jpg)



These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the Ansible file may be used to install only certain pieces of it, such as Filebeat.

install-elk.yml
filebeat-playbook.yml
metricbeat-playbook.yml

This document contains the following details:
- Description of the Topology
- Access Policies
- ELK Configuration
- Beats in Use
- Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly available, in addition to restricting unauthorized traffic to the network.
This protects the security risk of DDos attacks by evenly distributing high volumes of traffic.  By using a jump box the network has a secure single point of entry that audits and authorizes traffic before allowing access to content within. 

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the logs and system operations and functionality.
The two monitoring 'beats' installed on the ELK server were filebeats and metricbeats.  Filebeat monitors and alerts to unusual activity in logs and logging access activity in the network.  Metricbeat monitors the system processes , CPU usage, and other functionality metrics from the virtual harware in the network.

The configuration details of each machine may be found below.

| **Name** | **Function** | **IP Address** | **Operating System** |   |
|----------|--------------|----------------|----------------------|---|
| Jump Box | Gateway      | 10.1.0.7       | Linux                |   |
| DWVA -1  | Web Server   | 10.1.0.12      | Linux                |   |
| DWVA -2  | Web Server   | 10.1.0.8       | Linux                |   |
| ELK VM   | Elk Server   | 10.2.0.4       | Linux                |   |
|          |              |                |                      |   |
|          |              |                |                      |   |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the JumpBox Provisioner machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
Any, 75.142.18.11

Machines within the network can only be accessed by SSH.
The Jumpbox VM was allowed access to the ELK Server through the IP 20.106.98.144

A summary of the access policies in place can be found in the table below.

| **Name** | **Publicly Accessible** | **Allowed IP Addresses** |
|----------|-------------------------|--------------------------|
| Jump Box | yes                     | 75.142.18.11                     |
| DWVA -1  | no                      | 20.106.98.144            |
| DWVA -2  | no                      | 20.106.98.144            |
| ELK VM   | no                      | 20.106.98.144            |

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because provisioning, application deployment, and inter-network orchestration was simplified and automated.

The playbook implements the following tasks:
- Docker was installed to configue an Ansible container to automate and install the ELK container.
- In the ansible folder on the jumpbox the command ansible-playbook install_elk.yml was run.
- This installed the ELK playbook on the ELK host and prepared it to accept traffic from the DVWA VMs for monitoring.

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

! (https://github.com/Kakashizensei/Cybersecurity_Portfolio/blob/main/Diagrams/docker_ps.png)

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
Web-1 IP: 10.1.0.12
Web-2 IP: 10.1.0.8

We have installed the following Beats on these machines:
Filebeat and Metricbeat were sucessfully installed.

These Beats allow us to collect the following information from each machine:

 Filebeat detects changes to the filesystem. Specifically, it is used to collect Apache logs.
 
 Metricbeat detects changes in system metrics, such as CPU usage. We use it to detect SSH login attempts, failed sudo escalations, and CPU/RAM statistics.

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the ELK_install_yml file to /etc/ansible
- Update the hosts file to include the webhost IPs as well as the Elk Server IP.
- Run the playbook, and navigate to the Kibana URL which is local host IP plus port 5601 (http://104.208.27.51:5601/app/kibana) to check that the installation worked as expected.
- OR check from the command line: curl http://104.208.27.51:5601 

Answer the following questions: 

Which file is the playbook and where do you copy it? 

The playbooks are .yml files which instruct which modules to install on a machine and are copied to the Ansible folder located in the directory /etc/ansible.

Which file do you update to make Ansible run the playbook on a specific machine? 

The Ansible config file is updated to designate what machines playbooks run on. 

How do I specify which machine to install the ELK server on versus which to install Filebeat on? 

The config files can be edited to determine which machines run the ELK server vs Filebeat.

Which URL do you navigate to in order to check that the ELK server is running?

http://104.208.27.51:5601/app/kibana#/dashboard 


