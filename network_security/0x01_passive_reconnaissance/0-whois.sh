#!/bin/bash
whois "$1" | awk -F: '/^(Registrant|Admin|Tech)/{k=$1;v=$2;sub(/^ /,"",v);if(k~/(Phone Ext|Fax Ext)/)print k", ";else if(v=="")print k", ";else print k", "v}' > "$1.csv"
