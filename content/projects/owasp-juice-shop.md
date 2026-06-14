---
title: "OWASP Juice Shop Penetration Test"
date: 2025-01-15
tags: ["pentesting", "webapp", "burpsuite", "owasp"]
---

## Objective

Conduct a manual and tool-assisted penetration test against the OWASP Juice Shop application.

---

## Scope

| Category | Details |
|----------|---------|
| Authentication | Login mechanisms, password policies |
| Authorization | Role-based access controls |
| Input Validation | SQL injection, XSS, command injection |
| Session Management | Token handling, session timeout |

---

## Tools Used

| Tool | Purpose |
|------|---------|
| Burp Suite | Proxy, scanning, exploitation |
| Nmap | Port scanning, service enumeration |
| OWASP ZAP | Automated vulnerability scanning |
| Browser DevTools | Client-side testing |

---

## Key Findings

### 🔴 SQL Injection (Critical)

**Location:** Login endpoint

**Description:** Insufficient input validation leading to unauthorized database interaction.

**Impact:** Authentication bypass, data exfiltration

**Proof of Concept:**
```sql
' OR '1'='1' --
```
