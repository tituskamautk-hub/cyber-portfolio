---
title: "OWASP Juice Shop Penetration Test"
date: 2025-01-15
tags: ["pentesting", "webapp", "burpsuite", "owasp"]
---

## Scenario

A growing online retail company engaged a cybersecurity consultancy to assess the security of its public-facing e-commerce application before a major product launch. Management was concerned that vulnerabilities within the application could expose customer information, disrupt operations, or damage the company's reputation.

As a **Junior Penetration Tester**, I was tasked with conducting a manual and tool-assisted penetration test against the web application. The assessment focused on identifying vulnerabilities related to authentication, authorization, input validation, and sensitive data exposure. The goal was to simulate realistic attacker techniques, validate security weaknesses, assess business risk, and provide actionable remediation recommendations.

The assessment was conducted using industry-standard methodologies, including the OWASP Web Security Testing Guide and OWASP Top 10 principles. Findings were documented in both executive and technical reports to support risk management and remediation efforts.

---

## Objective

Conduct a manual and tool-assisted penetration test against the OWASP Juice Shop application.

## Scope

| Category | Details |
|----------|---------|
| Authentication | Login mechanisms, password policies |
| Authorization | Role-based access controls |
| Input Validation | SQL injection, XSS, command injection |
| Session Management | Token handling, session timeout |

## Tools Used

| Tool | Purpose |
|------|---------|
| Burp Suite | Proxy, scanning, exploitation |
| Nmap | Port scanning, service enumeration |
| OWASP ZAP | Automated vulnerability scanning |

## Key Findings

### 🔴 SQL Injection (Critical)

**Location:** Login endpoint

**Description:** Insufficient input validation leading to unauthorized database interaction.

**Impact:** Authentication bypass, data exfiltration

**Remediation:** Implement parameterized queries

### 🟠 Broken Access Control (High)

**Location:** User profile endpoints

**Remediation:** Role-based access control implementation

## Recommendations

| Priority | Finding | Recommendation |
|----------|---------|----------------|
| P0 | SQL Injection | Parameterized queries + WAF rules |
| P1 | Broken Access Control | Implement RBAC |

## Outcome

The assessment identified multiple critical vulnerabilities that could lead to full application compromise. All findings were documented with proof-of-concept examples and remediation guidance. The client received both executive and technical reports to support risk management decisions.

## Skills Demonstrated

- Web Application Security
- Vulnerability Validation
- Security Reporting
- Burp Suite Mastery

*This assessment was conducted in an authorized lab environment.*
