---
title: "HealthSecure Systems Incident Response Report"
date: 2025-04-12
tags: ["incident-response", "dfir", "breach", "phishing"]
type: "report"
---

## HealthSecure Systems Incident Response Report

**Reference:** 2025-HSS-IR-002
**Severity:** SEV P1 - CRITICAL
**Classification:** CONFIDENTIAL - Internal Use Only
**Prepared By:** Titus Kamau - Cybersecurity Incident Response Lead

---

### Executive Summary

On April 12, 2025, HealthSecure Systems suffered a confirmed security breach initiated by a phishing email. The attacker gained access to a Finance workstation, executed PowerShell to download malware, and moved laterally toward the HR SQL server containing payroll and PII.

### Critical Finding

The attacker used cached credentials of a former employee (**jcampbell**) whose Active Directory account was never disabled - representing a critical identity management failure.

### MITRE ATT&CK Kill Chain

| Stage | Tactic | Activity |
|-------|--------|----------|
| 1 | Initial Access (T1566) | Phishing email with malicious link |
| 2 | Execution (T1204) | User clicked link, PowerShell executed |
| 3 | Persistence (T1053) | Scheduled task created |
| 4 | Privilege Escalation (T1078) | Used cached credentials of former employee |
| 5 | Discovery (T1018) | Network scan to HRSQL01 and DevAppServer |
| 6 | Lateral Movement (T1021) | PsExec, SMB, RDP, SSH attempts |

### Containment Actions Completed

- Isolated Workstation23 (quarantine VLAN)
- Blocked malicious domains/IPs at firewall
- Disabled former employee AD account (jcampbell)
- Reset all compromised credentials
- Implemented temporary network segmentation

### Recommendations

| Priority | Action | Timeline |
|----------|--------|----------|
| Critical | Automated user de-provisioning (HR-AD integration) | 14 days |
| Critical | Enforce MFA for all administrative logins | 30 days |
| High | Enable PowerShell logging on 100% of endpoints | 7 days |
| High | Quarterly phishing simulations | 30 days |

### Lessons Learned

- Root cause: Identity management failure (active account 28 days after termination)
- Detection gap: PowerShell logging disabled on 30% of endpoints
- Process gap: IR playbook outdated (last updated 2022)

[View Full Report](/reports/HealthSecure-IR-Report.pdf)
