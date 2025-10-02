# Automated Website Recon Tool

A simple **Bash** script that automates common reconnaissance tasks for a given domain.  
It runs WHOIS, DNS enumeration, traceroute, GeoIP lookup, Nmap scans, web scanners (Nikto / Nuclei), TheHarvester and more — then saves timestamped, organized reports to a `reports/` folder.

> ⚠️ **Important — Use responsibly:** Only run this script against systems you own or have explicit permission to test. Unauthorized scanning may be illegal.

---

## Features
- WHOIS lookup  
- DNS enumeration (`dig`, `nslookup`)  
- Traceroute  
- GeoIP lookup  
- Nmap scans:
  - Port scan
  - Service detection
  - Vulnerability scripts (`--script vuln`)
- Web scanning with **Nikto** and **Nuclei**  
- Email & subdomain discovery with **TheHarvester**  
- Timestamped output files and a consolidated master report  
- Colored console output for readability

---

## Requirements

Install the following tools on your system:

- `bash`
- `whois`
- `dig` (part of `dnsutils` / `bind-tools`)
- `nslookup`
- `traceroute`
- `geoiplookup`
- `nmap`
- `nikto`
- `nuclei`
- `theHarvester`
- `timeout` (from `coreutils`)

### Example install commands

**Debian / Ubuntu**
```bash
sudo apt update
sudo apt install -y whois dnsutils inetutils-traceroute geoip-bin nmap nikto nuclei theharvester coreutils
# Note: package names can vary; on some systems traceroute is in package 'traceroute' or 'inetutils-traceroute'
