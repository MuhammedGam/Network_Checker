# Network Connectivity Monitor Script

This is a Bash script that monitors the network connectivity of a Linux system by periodically pinging a specific website (e.g., `google.com`). It logs both successful and failed connectivity checks, and if the system is offline for more than 3 consecutive checks, it attempts to restart the network service.

## Features

- **Periodic Network Check**: Pings a specified website (default: `google.com`) every 5 minutes.
- **Log File**: Logs the network status (up or down) with timestamps into a log file (`network_monitor.log`).
- **Network Service Restart**: If the system is offline for more than 3 consecutive checks, it will automatically attempt to restart the network service (`NetworkManager`).
- **Customizable Website**: You can change the website being pinged by modifying the script.

## Requirements

- **Linux-based system**: The script is designed to run on Linux systems.
- **Ping command**: The `ping` command must be available to check connectivity.
- **NetworkManager**: The script assumes the `NetworkManager` service is being used to manage network connectivity.

