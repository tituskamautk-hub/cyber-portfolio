---
title: "Python Port Scanner"
date: 2025-01-12
tags: ["python", "networking", "tool"]
---

## Scenario

Security analysts frequently require rapid visibility into open services and exposed network ports when conducting asset discovery, vulnerability assessments, and security investigations. Manual enumeration can be time-consuming, particularly when assessing multiple hosts across a network.

To address this challenge, I designed and developed a multi-threaded Python Port Scanner capable of identifying open TCP ports and active services across target systems. The objective was to strengthen my understanding of network protocols, socket programming, and security automation while creating a practical tool that could support network reconnaissance activities.

The project involved implementing concurrent scanning techniques, optimizing performance, handling network exceptions, and presenting results in a clear and actionable format. The completed tool demonstrates practical Python development skills and foundational penetration testing concepts.

---

### Code Example

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

# Usage
target = "scanme.nmap.org"
for port in range(1, 1025):
    thread = threading.Thread(target=scan_port, args=(target, port))
    thread.start()
