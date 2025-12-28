#!/bin/bash
whois "$1" | awk -F: '/^(Registrant|Admin|Tech)/{f=$1;v=$2;sub(/^ /,"",v);if(f~/(Street)/)v=v" ";if(f~/(Phone Ext|Fax Ext)/)print f":,";else print f","v}' > "$1.csv"
