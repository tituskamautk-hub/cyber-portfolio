---
title: "My First CTF: TryHackMe Pre-Security"
date: 2024-01-15
tags: ["TryHackMe", "beginner", "CTF"]
---

## Getting Started

I recently completed TryHackMe's **Pre-Security** learning path. This was my first real step into cybersecurity!

## What I Learned

### 🌐 Network Fundamentals
- The OSI model (7 layers of networking)
- How TCP/IP works
- Common ports and their services:
  - Port 22: SSH
  - Port 80: HTTP
  - Port 443: HTTPS
  - Port 53: DNS

### 🖥️ How the Web Works
- HTTP requests and responses
- Status codes (200, 301, 404, 500)
- Cookies and sessions
- DNS resolution process

### 🐧 Linux Basics
Essential commands I mastered:

```bash
# File operations
ls -la              # List all files with details
cd /home           # Change directory
cp source dest     # Copy files
mv old new         # Move/rename files
rm file.txt        # Remove files

# Permissions
chmod 755 script.sh
chown user:group file

# System info
whoami
id
sudo -l
ps aux
