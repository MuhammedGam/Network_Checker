
#!/bin/bash
log_file=network_monitor.log
 touch "$log_file"
FAIL_COUNT=0
MAX_FAILS=3
log_message() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" >> "$log_file"
}
# Infinite loop to monitor network connectivity
while true; do
    if ping -c 3  google.com &> /dev/null; then
    #sending 3 packets to google.
        log_message "Network is UP."
        FAIL_COUNT=0
        # Reset fail count if the network is up
    else
        log_message "Network is DOWN."
        ((FAIL_COUNT++))
    fi

    if (( FAIL_COUNT >= MAX_FAILS )); then
        log_message "Network DOWN for $FAIL_COUNT checks. Restarting..."
        systemctl restart NetworkManager && log_message "Network restarted successfully." || log_message "Failed to restart network service."
        FAIL_COUNT=0
        # Reset fail count after attempting restart
    fi
# Wait for 5 minutes before the next check
    sleep 300
done