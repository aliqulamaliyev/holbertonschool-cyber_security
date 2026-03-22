#!/bin/bash
sudo nmap -f -p 80-85 -T2 -sF "$1"
