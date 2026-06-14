---
title: "SOC Incident Report - Phishing Unfolding"
date: 2026-06-05
tags: ["soc", "incident-response", "phishing", "tryhackme"]
type: "report"
---

## SOC Incident Report - TryHackMe SOC Simulator

**Incident Reference:** INC-2026-060401
**Classification:** CONFIDENTIAL — INTERNAL USE ONLY
**Severity:** HIGH
**Analyst:** Tier 2 SOC Analyst — Titus Kamau

---

### Executive Summary

On June 4th, 2026, a high-severity endpoint compromise was identified. An unauthorized threat actor gained an interactive foothold, deploying PowerView.ps1 for reconnaissance and using Robocopy to harvest data from network shares.

### Key Metrics

| Metric | Value |
|--------|-------|
| Mean Time to Detect (MTTD) | 38 minutes |
| Mean Time to Respond (MTTR) | 2 minutes |
| True Positive Rate | 80% |
| Total Alerts Closed | 35 |

### Incident Timeline

| Time | Event |
|------|-------|
| 20:49:24 | PowerView.ps1 dropped on win-3450 via PowerShell |
| 20:52:06 | Robocopy.exe launched to harvest files from Z:\ drive |
| 21:xx | Containment initiated - host isolated |

### Indicators of Compromise (IOCs)

| Type | Indicator |
|------|-----------|
| Host | win-3450 |
| Compromised Account | michael.ascot |
| Malicious File | PowerView.ps1 |
| Abused Utility | Robocopy.exe |
| Malicious Domain | hatventuresworldwide.online |

### MITRE ATT&CK Mapping

| Technique | ID |
|-----------|-----|
| Phishing | T1566 |
| PowerShell | T1059.001 |
| Valid Accounts | T1078 |
| Lateral Movement | T1021 |

### Recommendations

1. **Application Control:** Prevent script execution from user-writable directories
2. **EDR Throttling:** Auto-quarantine mass file-copy behaviors
3. **Least Privilege Audit:** Restrict broad access to network shares

[View Full Report](/reports/SOC-Incident-Report.pdf)
