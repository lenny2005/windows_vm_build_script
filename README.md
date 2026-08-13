# windows_vm_build_script
Automated Windows VM provisioning script that configures system settings, installs prerequisite software, configures unattended automation settings, grants Remote Desktop access, and produces a deployment report.
Windows VM Provisioning Automation
Overview

This project is a PowerShell-based virtual machine provisioning and configuration script developed during my IT internship at Kearny Bank.

The original version was created to streamline the repetitive process of preparing Windows virtual machines for automation, development, and operational use. To respect company confidentiality, all organization-specific infrastructure details, application names, network paths, and account information have been removed from this public version.

The goal of the automation was to reduce manual configuration time, improve deployment consistency, and provide a repeatable process for preparing new virtual machines.

Features
System Configuration
Launches Windows Update for patch verification
Configures system time zone
Configures display resolution settings
Configures unattended automation display settings through registry modifications
Software Validation & Installation
Checks whether required software is already installed
Skips applications that are already present
Installs missing prerequisites automatically
Tracks installation status for each application
Remote Access Configuration
Adds predefined users or service accounts to the Remote Desktop Users group
Prevents duplicate user additions
Reports the final configuration status
Deployment Reporting
Tracks all provisioning actions
Records deployment status including:
Installed
Skipped
Started
Failed
Configured
Provides a summary report at the end of execution
Displays total runtime statistics
Idempotent Design

The script is designed to be rerun safely.

If software is already installed, it is automatically skipped instead of being reinstalled.

Technologies Used
PowerShell
Windows Administration
Windows Registry
User and Group Management
Software Deployment Automation
Virtual Machine Provisioning
System Configuration Automation
Example Workflow
Plain Text
1
Start Build
2
 
3
├── Verify Installation Sources
4
├── Open Windows Update
5
├── Configure Time Zone
6
├── Install Required Software
7
├── Configure Automation Settings
8
├── Configure Display Settings
9
├── Configure Remote Desktop Access
10
├── Generate Deployment Review
11
└── Display Runtime Summary
Show more lines
Example Deployment Output
Plain Text
1
========== DEPLOYMENT REVIEW ==========
2
 
3
Item Status
4
--------------------------- ----------
5
Windows Update OPENED
6
Time Zone CONFIGURED
7
Office Suite INSTALLED
8
Runtime Dependencies SKIPPED
9
Automation Platform INSTALLED
10
Database Tools INSTALLED
11
Enterprise Application STARTED
12
Display Resolution CONFIGURED
13
Remote Access CONFIGURED
Show more lines
What I Learned

This project gave me hands-on experience with:

PowerShell scripting
Windows administration
Software deployment strategies
Registry management
VM provisioning workflows
Administrative automation
Error handling and validation
Process standardization

One of the primary goals was reducing the amount of manual effort required to prepare a new virtual machine while ensuring that every deployment followed the same configuration standards.

Internship Context

This project was originally developed during my internship with Kearny Bank's IT Department as part of ongoing efforts to improve operational efficiency through automation.

The public version has been generalized to remove proprietary information while preserving the overall architecture, workflow design, and automation concepts.

Author

Lianet Caldero
 Computer Science Student, Ramapo College of New Jersey

Interests:

IT Automation
PowerShell Development
ServiceNow
Power Automate
Systems Administration
Software Development
Enterprise Process Improvement

Note: This repository contains a sanitized educational version of the original project. All organization-specific information, infrastructure details, user accounts, application names, and network resources have been removed or generalized.
