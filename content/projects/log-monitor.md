---
title: "Log Monitoring Script"
date: 2024-01-14
tags: ["bash", "monitoring", "security"]
---

## 📊 Log Monitoring Script

A bash script that continuously monitors system logs for security events.

### Purpose

Detect suspicious activity in real-time:
- Failed login attempts (brute force)
- Unauthorized sudo access
- Suspicious process execution

### Features

- **Real-time monitoring** of auth.log
- **Alert thresholds** configurable
- **IP tracking** for repeat offenders
- **Daily summary reports**

### The Script

```bash
#!/bin/bash

# Configuration
LOG_FILE="/var/log/auth.log"
ALERT_THRESHOLD=5
ALERT_EMAIL="admin@example.com"
SUSPICIOUS_IPS="/tmp/suspicious_ips.txt"

# Colors for output
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${YELLOW}[+] Starting Security Log Monitor${NC}"

# Monitor failed SSH attempts
tail -n0 -f "$LOG_FILE" | while read line; do
    if echo "$line" | grep -q "Failed password"; then
        IP=$(echo "$line" | awk '{print $11}')
        echo "$IP" >> "$SUSPICIOUS_IPS"
        
        COUNT=$(grep -c "$IP" "$SUSPICIOUS_IPS")
        
        if [ "$COUNT" -ge "$ALERT_THRESHOLD" ]; then
            echo -e "${RED}[ALERT] $COUNT failed attempts from $IP${NC}"
            
            # Send alert (optional)
            # echo "Alert: $COUNT failed SSH attempts from $IP" | mail -s "Security Alert" $ALERT_EMAIL
        fi
    fi
    
    # Monitor sudo failures
    if echo "$line" | grep -q "sudo.*COMMAND.*FAILED"; then
        USER=$(echo "$line" | awk '{print $9}')
        COMMAND=$(echo "$line" | grep -o "COMMAND=.*" | cut -d'=' -f2)
        echo -e "${RED}[ALERT] Sudo failure by $USER attempting: $COMMAND${NC}"
    fi
done

# Save the script
sudo nano /usr/local/bin/security-monitor.sh

# Make executable
sudo chmod +x /usr/local/bin/security-monitor.sh

# Run as service
sudo ./security-monitor.sh

# /etc/systemd/system/security-monitor.service
[Unit]
Description=Security Log Monitor
After=network.target

[Service]
Type=simple
ExecStart=/usr/local/bin/security-monitor.sh
Restart=always
User=root

[Install]
WantedBy=multi-user.target

sudo systemctl enable security-monitor
sudo systemctl start security-monitor

[ALERT] 7 failed attempts from 192.168.1.100
[ALERT] Sudo failure by john attempting: /bin/su -
[ALERT] 12 failed attempts from 10.0.0.50

