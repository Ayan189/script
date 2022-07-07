#!/bin/bash
echo "3rd highest process using the cpu"
echo "process           PID %MEM %CPU"
sudo ps -eo comm=,pid,%mem,%cpu --sort=-%cpu | head |  awk 'FNR>=4 && FNR<=4'
echo "Port Number"
sudo netstat -tulpn | grep "$(ps -eo pid --sort=-%cpu | awk 'FNR>=4 && FNR<=4' | awk {'print " " $1 "/"'})" | awk '{print $4}'
echo "  "
echo "  "
echo "3rd highest process using the memory"
echo "process           PID %MEM %CPU"
sudo ps -eo comm=,pid,%mem,%cpu --sort=-%mem | head |  awk 'FNR>=4 && FNR<=4'
echo "Port Number"
sudo netstat -tulpn | grep "$(ps -eo pid --sort=-%mem | awk 'FNR>=4 && FNR<=4' | awk {'print " " $1 "/"'})" | awk '{print $4}'
