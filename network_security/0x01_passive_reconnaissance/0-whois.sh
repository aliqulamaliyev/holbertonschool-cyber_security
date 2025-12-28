#!/bin/bash
whois "$1" | awk -F: '/^(Registrant|Admin|Tech)/{k=$1;sub(/^[^ ]+ /,"",k);v=$2;gsub(/^ /,"",v);if($1~/(Street)/)v=v" ";if($1~/(Phone Ext|Fax Ext)/)print k":,";else print k","v}' > "$1.csv"
