# Save this entire content as build.ps1 in your titus-portfolio folder

Write-Host "Building portfolio..." -ForegroundColor Green

# Delete old config
Remove-Item hugo.toml -Force -ErrorAction SilentlyContinue

# Create config file
$config = @'
baseURL = "http://localhost:1313/"
title = "Titus Kamau - Cybersecurity Portfolio"
theme = "PaperMod"

[params]
  defaultTheme = "dark"

[[menu.main]]
  name = "Home"
  url = "/"
  weight = 5

[[menu.main]]
  name = "Cybersecurity"
  url = "/cybersecurity/"
  weight = 10

[[menu.main]]
  name = "Reports"
  url = "/reports/"
  weight = 15

[[menu.main]]
  name = "Risk & Compliance"
  url = "/risk-compliance/"
  weight = 20

[[menu.main]]
  name = "Blog"
  url = "/blog/"
  weight = 25

[[menu.main]]
  name = "About"
  url = "/about/"
  weight = 30

[markup.goldmark.renderer]
  unsafe = true
'@

$config | Out-File -FilePath hugo.toml -Encoding ascii

# Create folders
New-Item -Path "content/cybersecurity" -ItemType Directory -Force | Out-Null
New-Item -Path "content/reports" -ItemType Directory -Force | Out-Null
New-Item -Path "content/risk-compliance" -ItemType Directory -Force | Out-Null
New-Item -Path "content/blog" -ItemType Directory -Force | Out-Null
New-Item -Path "layouts" -ItemType Directory -Force | Out-Null

# About page
@'
---
title: "About Me"
---

## Titus Kamau

Cybersecurity Professional

### Certifications
- ISC2 Certified in Cybersecurity (CC) - Completed
- TryHackMe Pre-Security - Completed
- TryHackMe Jr Penetration Tester - Completed
- CompTIA Security+ - In Progress

### Connect
- GitHub: github.com/tituskamautk-hub
- LinkedIn: linkedin.com/in/titus-kamau
- TryHackMe: tryhackme.com/p/titus.kamau
- Email: tituskamau.tk@gmail.com
'@ | Out-File -FilePath "content/about.md" -Encoding utf8

# Cybersecurity landing page
@'
---
title: "Cybersecurity"
---

## Cybersecurity Projects

- OWASP Juice Shop - Web App Penetration Test
- HealthSecure - Incident Response Investigation
- Acme AeroTech - Network Security Assessment
- Python Port Scanner - Security Tool
- Log Monitor - Security Automation
- Secure Password Generator - Cryptography Tool
'@ | Out-File -FilePath "content/cybersecurity/_index.md" -Encoding utf8

# OWASP Project
@'
---
title: "OWASP Juice Shop Penetration Test"
date: 2025-01-15
tags: ["pentesting", "webapp"]
---

## Objective

Penetration test against OWASP Juice Shop.

## Key Findings

### SQL Injection (Critical)

**Proof of Concept:** Entering admin password bypass string resulted in authentication bypass.

**Remediation:** Parameterized queries

### Broken Access Control (High)

**Remediation:** Implement RBAC
'@ | Out-File -FilePath "content/cybersecurity/owasp-juice-shop.md" -Encoding utf8

# HealthSecure Project
@'
---
title: "HealthSecure Incident Response"
date: 2025-01-14
tags: ["incident-response", "dfir"]
---

## Scenario

Investigated cyber incident affecting HealthSecure Systems.

## Timeline

- 09:15: Initial phishing access
- 09:23: Malicious process execution
- 09:31: C2 beacon detected

## Outcome

Complete incident timeline and containment strategy developed.
'@ | Out-File -FilePath "content/cybersecurity/healthsecure-ir.md" -Encoding utf8

# Acme Project
@'
---
title: "Acme AeroTech Assessment"
date: 2025-01-13
tags: ["network-security"]
---

## Key Recommendations

1. VLAN Segmentation
2. Firewall Hardening
3. Centralized Monitoring
'@ | Out-File -FilePath "content/cybersecurity/acme-aerotech.md" -Encoding utf8

# Port Scanner
@'
---
title: "Python Port Scanner"
date: 2025-01-12
tags: ["python", "tool"]
---

## Python Port Scanner

Multi-threaded port scanner for network reconnaissance.

```python
import socket
import threading

def scan_port(target, port):
    sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    sock.settimeout(1)
    result = sock.connect_ex((target, port))
    if result == 0:
        print(f"Port {port}: Open")
    sock.close()