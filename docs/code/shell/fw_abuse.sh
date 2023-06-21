#!/bin/bash

# Download file
url="https://feodotracker.abuse.ch/downloads/ipblocklist_recommended.txt"
wget -q $url -O blocklist.txt

# Remove the header from the blocklist, which are lines 1 to 9.
sed '1,9d' blocklist.txt > importlist.txt

# Convert to LF endings
dos2unix importlist.txt

## Delete old blocked ip addresses ##
# Sort the numbers for humans and reverse -> descending.
# UFW changes the number after deleting so after deleting rule 1, rule 2
# will be the new number 1.
sudo ufw status numbered | grep "DENY OUT" | grep -oP '\[\K\d+(?=\])' | sort -rh > matches.txt

cat matches.txt | while read line 
do
    # Remove old ip adresses from firewall.
    # See help: https://superuser.com/a/1564148
    # ufw asks the user for a `y` or `n` so 
    # we have to become a little creative here.
    yes | sudo ufw delete $line
done

cat importlist.txt | while read line 
do
    # Deny any outgoing traffic to one of these ip addresses.
    sudo ufw deny out from any to "$line"
done

echo "Done!"