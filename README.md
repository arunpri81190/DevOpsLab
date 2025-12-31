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

###6. service_monitor.sh
Description:
Checks whether a given Linux service is running using systemctl
Usage:
bash service_monitor.sh <service_name>
Example:
bash service_monitor.sh ssh
Output:
Service 'ssh' is RUNNING

###7. cron_jobs.sh
This project provides a lightweight Bash-based automation to monitor the status of a Linux service (e.g., nginx) at regular intervals using cron. The script logs the service status to a file, making it easy to track uptime and diagnose issues

Features
- Monitors any systemd-managed service (e.g., nginx, ssh, cron)
- Runs automatically at scheduled intervals via cron
- Logs service status to a file for easy tracking
- Easily customizable for different services or intervals
Steps:
1. Clone the repo
2. Create the monitoring script(for us we've already created the "service_monitor.sh" file)
3. Make it executable
4. Add the cron job to the file
5. Test the script using "bash service_monitor.sh <service_name>" Eg: bash service_monitor.sh nginx
6. Append or echo the output to a logfile (service_logs.txt)
7. Make any changes like start or stop the service and check the logs after the time set on cron(5 mins in our case)
