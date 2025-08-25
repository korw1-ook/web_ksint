
#!/bin/bash

# Colors
RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
BLUE="\e[34m"
RESET="\e[0m"

# Banner
echo -e "${BLUE}========================================${RESET}"
echo -e "${GREEN}     Automated Website Recon Tool       ${RESET}"
echo -e "${BLUE}========================================${RESET}"

# Input target
read -p "Enter target domain (example.com): " domain

# Report file
mkdir -p reports
report="reports/${domain}_report.txt"
echo "Recon Report for: $domain" > "$report"
echo "Generated on: $(date)" >> "$report"
echo "======================================" >> "$report"

# Function to run a command and log output
run_task () {
    echo -e "${YELLOW}Running $1...${RESET}"
    echo -e "\n========== $1 ==========\n" >> "$report"
    $2 >> "$report" 2>&1
    echo -e "${GREEN}$1 complete.${RESET}\n"
}

# Run tasks one by one
run_task "WHOIS" "whois $domain"
run_task "DIG (DNS Records)" "dig $domain ANY +short"
run_task "NSLOOKUP" "nslookup $domain"
run_task "Traceroute" "traceroute $domain"
run_task "GeoIP Lookup" "geoiplookup $(dig +short $domain | head -n1)"
run_task "Nmap Port Scan" "nmap -Pn -T4 $domain"
run_task "Nmap Service Detection" "nmap -sV $domain"
run_task "Nmap Vulnerability Scan" "nmap --script vuln $domain"
run_task "Nikto Web Scan" "nikto -h $domain"
run_task "Nuclei Vulnerability Templates" "nuclei -u $domain"
run_task "TheHarvester (emails, subdomains, etc.)" "theHarvester -d $domain -b all"

echo -e "${BLUE}========================================${RESET}"
echo -e "${GREEN}Recon complete! Report saved to $report${RESET}"
echo -e "${BLUE}========================================${RESET}"
