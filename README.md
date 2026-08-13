# Windows VM Provisioning Automation

## Overview

This project is a PowerShell-based virtual machine provisioning and configuration script developed during my IT internship at **Kearny Bank**.

The original version was created to streamline the repetitive process of provisioning Windows virtual machines used for automation, development, and operational support. To respect confidentiality and security requirements, all organization-specific infrastructure details, application names, network paths, and account information have been removed from this public version.

The objective of the automation was to reduce manual setup time, improve consistency across deployments, and establish a repeatable process for preparing new virtual machines.

---

## Features

### System Configuration
- Launches Windows Update for patch verification
- Configures system time zone
- Configures display resolution settings
- Configures unattended automation display settings through registry modifications

### Software Validation & Installation
- Validates whether required software is already installed
- Skips applications that are already present
- Installs missing prerequisites automatically
- Tracks installation status for each application

### Remote Access Configuration
- Adds predefined users or service accounts to the Remote Desktop Users group
- Prevents duplicate additions
- Validates final configuration

### Reporting & Auditing
- Tracks all provisioning activities
- Generates deployment status reporting
- Produces runtime statistics
- Displays a deployment summary before script completion

### Idempotent Design
The script can be safely rerun multiple times.

Applications that are already installed or configurations that already exist are automatically skipped to prevent unnecessary changes.

---

## Technologies Used

- PowerShell
- Windows Administration
- Windows Registry Management
- User & Group Administration
- Software Deployment Automation
- Virtual Machine Provisioning
- System Configuration Automation

---

## Workflow

```text
Start Deployment
│
├── Verify Installation Sources
├── Launch Windows Update
├── Configure Time Zone
├── Install Required Software
├── Configure Automation Settings
├── Configure Display Resolution
├── Configure Remote Desktop Access
├── Generate Deployment Review
└── Display Runtime Summary
```

---

## Example Output

```text
========== DEPLOYMENT REVIEW ==========

Item                          Status
---------------------------   ----------
Windows Update                OPENED
Time Zone                     CONFIGURED
Office Suite                  INSTALLED
Runtime Dependencies          SKIPPED
Automation Platform           INSTALLED
Database Tools                INSTALLED
Enterprise Application        STARTED
Display Resolution            CONFIGURED
Remote Access                 CONFIGURED

========== SUMMARY ==========
Started : 2026-08-13 09:15:00
Finished: 2026-08-13 09:27:34
Duration: 0h 12m 34s
```

---

## Business Impact

Prior to automation, virtual machine preparation required multiple manual steps including:

- Downloading installation packages
- Installing software dependencies
- Configuring system settings
- Adjusting automation platform settings
- Granting remote access permissions
- Validating deployment completion

Automating these tasks significantly reduced setup time, minimized human error, and ensured consistency across deployed environments.

---

## Key Skills Demonstrated

### PowerShell Development
- Functions
- Conditional logic
- Error handling
- Registry management
- User and group administration

### Windows Administration
- Software deployment
- System configuration
- Time zone management
- Display configuration
- Remote Desktop administration

### Process Automation
- Infrastructure standardization
- Configuration management
- Deployment validation
- Runtime reporting

### IT Operations
- VM provisioning
- Software lifecycle management
- Administrative automation
- Operational efficiency improvements

---

## What I Learned

This project provided hands-on experience in:

- Enterprise PowerShell scripting
- Windows systems administration
- Software deployment automation
- Registry configuration management
- Administrative process automation
- Infrastructure provisioning
- Operational documentation
- End-user support workflows

The project reinforced the importance of building repeatable, maintainable processes that reduce manual effort while improving reliability.

---

## Internship Context

This project was originally developed during my internship with **Kearny Bank's Information Technology Department**.

The automation was designed to assist with virtual machine provisioning and configuration tasks by reducing repetitive manual work performed by technical staff during system setup and deployment activities.

This public repository contains a generalized version created for portfolio and educational purposes. All proprietary, confidential, and organization-specific information has been removed while preserving the overall architecture, design patterns, and automation concepts.

---

## Author

**Lianet Caldero**  
Computer Science Student  
Ramapo College of New Jersey

### Areas of Interest

- IT Automation
- PowerShell Development
- Windows Administration
- ServiceNow
- Power Automate
- Software Development
- Systems Engineering
- Enterprise Process Improvement

---

## Disclaimer

This repository contains a sanitized educational version of an automation project originally developed in a professional environment.

All organization-specific:
- Network paths
- User accounts
- Server names
- Software names
- Infrastructure details
- Internal processes

have been modified or removed to protect confidentiality while maintaining the technical concepts and structure of the solution.
