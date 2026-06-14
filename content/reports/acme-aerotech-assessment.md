---
title: "Acme AeroTech Security Assessment"
date: 2026-05-18
tags: ["network-security", "risk-assessment", "vlan", "compliance"]
type: "report"
---

## Acme AeroTech - Security & Resilience Assessment

**Prepared For:** Acme AeroTech
**Prepared By:** Titus Kamau
**Assessment Type:** Cybersecurity Review
**Date:** May 18, 2026

---

### Organization Profile

| Metric | Value |
|--------|-------|
| Industry | Aerospace parts manufacturing |
| Employees | 75 |
| IT Team Size | 2 persons |
| Network Age | 5 years |
| Redundancy | None |

---

### Key Challenges Identified

| Issue | Risk |
|-------|------|
| Flat, unsegmented network | Lateral movement after any compromise |
| Default credentials on router, web, FTP, database | Easy unauthorized access |
| No patch management program | Known unpatched CVEs exploitable |
| No redundancy | Full outages during maintenance |

---

### Vulnerability Analysis

| Vulnerability | Likelihood | Impact | Priority |
|---------------|------------|--------|----------|
| Default credentials | High | High | HIGH |
| Flat network / no segmentation | High | High | HIGH |
| No patch management | High | Medium | HIGH |
| Single firewall / switch | Medium | High | MEDIUM |
| FTP plaintext | Medium | Medium | MEDIUM |

---

### Recommended Network Redesign

**6 VLANs:**
- VLAN 10 - Management
- VLAN 20 - Servers
- VLAN 30 - User PCs
- VLAN 40 - IoT/IP Cameras
- VLAN 45 - Guest Wi-Fi (Internet only)
- VLAN 50 - DMZ

**Additional Controls:**
- Redundant active-passive HA firewall pair
- Second ISP for WAN failover
- SFTP replaces FTP
- MFA on all admin access
- WSUS/PDQ for patch management

---

### 6-Week Rollout Timeline

| Week | Actions |
|------|---------|
| 1 | Change all default credentials; enable host firewalls |
| 2-3 | Implement VLANs (user vs. server split first) |
| 4 | Second ISP + patch management server |
| 5 | Move web server to DMZ; replace FTP with SFTP; enforce MFA |
| 6 | Isolate guest Wi-Fi; onboard MSSP monitoring |

---

### Skills Demonstrated

- Network security architecture
- Risk assessment and prioritization
- Compliance framework alignment
- Technical documentation
- Strategic remediation planning

[View Full Report](/reports/AcmeAeroTech-Assessment.pdf)
[View Network Diagram](/images/AcmeAeroTech-Network-Diagram.png)
