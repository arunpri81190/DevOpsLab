# DevOpsLab

This repository contains my DevOps learning journey, starting with Linux and Python automation.

## 📁 Script: daily_log.sh

Creates a daily log file with the current date.

### Usage

```bash
bash daily_log.sh

🔧 Tools Used
- GitBash
- GitHub

## 📊 Monitoring Scripts

This folder contains basic system monitoring scripts:

### 1. `disk_usage_alert.sh`
- Checks disk usage on the root (`/`) partition
- Alerts if usage exceeds 80%

### 2. `memory_monitor.sh`
- Displays current memory and swap usage
- Saves output to terminal

### 3. `process_monitor.sh`
- Displays top 5 processes by memory and CPU usage
- Useful for identifying resource-heavy applications

### 🔧 How to Run
```bash
bash disk_usage_alert.sh
bash memory_monitor.sh

### 4. ping_monitor.sh

**Description:**  
Checks if a given host (domain or IP) is reachable using `ping`.

**Usage:**  
```bash
bash ping_monitor.sh <hostname or IP>

###5. http_status.sh

**Description:**  
Checks the HTTP status code of a given URL using `curl`. It follows redirects and provides a human-readable explanation of the result.

**Usage:**  
```bash
bash http_status.sh <URL>

###6. responsetime.sh
Description:
Measures the response time of a given URL using curl. Reports DNS lookup, TCP connect, TLS handshake, server response, and total time.
Example:
bash response_time.sh https://google.com
Output:
Measuring response time for: https://google.com
DNS Lookup     : 0.012s
TCP Connect    : 0.045s
TLS Handshake  : 0.089s
Server Response: 0.134s
Total Time     : 0.200s

