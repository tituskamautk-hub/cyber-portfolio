---
title: "Log Monitoring Script"
date: 2025-01-11
tags: ["bash", "monitoring", "security"]
---

## Scenario

Modern organizations generate significant volumes of system and security logs, making it difficult for administrators to manually review events and identify suspicious activity in a timely manner. Delayed detection can allow threats to persist unnoticed within an environment.

To improve visibility and automate monitoring processes, I developed a **Log Monitoring utility** designed to analyze log files and identify indicators of potentially malicious activity. The tool was created to support early detection of suspicious events such as failed authentication attempts, unauthorized access attempts, and unusual system behavior.

The project focused on log parsing, pattern matching, event filtering, and automated alert generation. Through this project, I gained practical experience in security operations, detection engineering, and security automation techniques commonly used within Security Operations Centers (SOCs).

---

### The Script

```bash
#!/bin/bash

LOG_FILE="/var/log/auth.log"
ALERT_THRESHOLD=5

tail -n0 -f "$LOG_FILE" | while read line; do
    if echo "$line" | grep -q "Failed password"; then
        IP=$(echo "$line" | awk '{print $11}')
        echo "[ALERT] Failed attempt from $IP"
    fi
done
