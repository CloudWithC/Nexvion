# Nexvion - Ansible Configuration Management

## Overview
Ansible automates the configuration of the Nexvion web server on the local Ubuntu host.

## Tools and Technologies
- Ansible Core 2.20.1
- Ubuntu Linux
- Nginx
- YAML
- Jinja2 Templates

## Project Structure
- ansible.cfg - Ansible configuration
- inventory/hosts.ini - Localhost inventory
- playbooks/setup-nexvion.yml - Configuration playbook
- templates/nexvion.conf.j2 - Nginx configuration template

## Implementation
1. Updated the APT package cache.
2. Installed Nginx.
3. Created /var/www/nexvion-ansible.
4. Copied Nexvion website files from the site directory.
5. Configured Nginx on port 8091.
6. Enabled and started Nginx.
7. Validated the Nginx configuration.

## Execution

Syntax validation:
ansible-playbook playbooks/setup-nexvion.yml --syntax-check

Playbook execution:
sudo ansible-playbook playbooks/setup-nexvion.yml -e ansible_become=false

## Verification

curl -I http://localhost:8091
curl -I http://localhost:8091/products.html
curl -I http://localhost:8091/payment.html

All three endpoints returned HTTP 200 OK.

## Idempotency

The playbook was executed a second time.

Second execution:
- OK: 9
- Changed: 0
- Failed: 0
- Unreachable: 0

This demonstrates idempotent configuration management.

## Outcome
Successfully automated Nexvion web server configuration using Ansible.

## Scope
- Inventory manages localhost.
- Nginx serves Nexvion on port 8091.
- Existing Docker deployment on port 8088 remains unchanged.
- This is a local configuration management implementation, not a remote production deployment.

