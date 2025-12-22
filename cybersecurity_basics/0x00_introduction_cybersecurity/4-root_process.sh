#!/bin/bash
ps -u "$1" -o user,pid,%cpu,%mem,vsz,rss,tty,stat,start,time,command | grep -vE " VSZ| 0[[:space:]]+0"
