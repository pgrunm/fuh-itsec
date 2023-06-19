#!/bin/bash

# Download file
url="https://feodotracker.abuse.ch/downloads/ipblocklist_recommended.txt"
wget -q $url -O blocklist.txt

# Remove the header from the blocklist, which are lines 1 to 9.
sed '1,9d' blocklist.txt > importlist.txt