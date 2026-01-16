# Secure FTP Server Deployment with Ansible & Vagrant

## Project Overview
This project implements an **Infrastructure as Code (IaC)** solution to deploy a secure, high-performance FTP server using **vsftpd** (Very Secure FTP Daemon).

The infrastructure is virtualized using **Vagrant** (Debian 12 Bookworm) and the configuration management is fully automated via **Ansible**. The goal is to create a reproducible, secure, and testable environment that simulates a real-world deployment scenario within a classroom network.

## Objectives
The main objective is to automate the provisioning of a secure file transfer service that meets specific strict requirements:

*   **Security:** Implementation of **SSL/TLS (FTPS)** to encrypt control and data connections.
*   **Access Control:** Strict separation between Anonymous users (Read-only) and Local users (Read/Write).
*   **Isolation (Chroot):** Implementation of "Jails" to restrict users to their home directories, with specific exceptions.
*   **Quality of Service (QoS):** Bandwidth throttling based on user type (2MB/s for anonymous vs. 5MB/s for authenticated users).
*   **Automation:** Zero-touch deployment using Ansible Playbooks.

## Infrastructure Architecture
The project consists of two virtual machines connected via a **Public Bridge Network**, simulating a real LAN environment.

| Machine Name | Hostname | Role | OS | Description |
| :--- | :--- | :--- | :--- | :--- |
| **Server** | `mirror.sistema.sol` | FTP Server | Debian 12 | Hosts the `vsftpd` service, provisioned by Ansible. |
| **Client** | `client` | Tester | Debian 12 | Used to perform security, connectivity, and bandwidth tests. |

## Technology Stack
*   **Virtualization:** Vagrant + VirtualBox.
*   **Configuration Management:** Ansible (Local Mode).
*   **Service:** vsftpd 3.0.x.
*   **Security:** OpenSSL (Self-signed certificates), ACLs.
*   **Version Control:** Git & GitHub.

## Project Team
This project is collaboratively developed, with shared responsibilities regarding infrastructure definition, Ansible automation logic, and Quality Assurance (QA) testing.

*   **David Expósito López** 
*   **Ángela Sánchez Robles** 

## Project Roadmap
The project is organized using Kanban methodology with the following phases:
1.  **Setup:** Repository initialization and environment preparation.
2.  **Infrastructure:** VM definition and network bridging.
3.  **Configuration:** Security rules definition (SSL, Bandwidth, Chroot).
4.  **Automation:** Ansible playbook development.
5.  **Testing:** Functional and security validation.
6.  **Documentation:** Final reporting and guide creation.

---
*Project developed for the System Administration module.*