# Quelle: https://apparmor.pujol.io/install/#ubuntu-debian
sudo apt install apparmor-profiles build-essential config-package-dev debhelper golang-go rsync git
git clone https://github.com/roddhjav/apparmor.d.git
cd apparmor.d
dpkg-buildpackage -b -d --no-sign
sudo dpkg -i ../apparmor.d_*_all.deb

# Speeding up Apparmor
echo 'write-cache' | sudo tee -a /etc/apparmor/parser.conf
echo 'Optimize=compress-fast' | sudo tee -a /etc/apparmor/parser.conf

# Check Apparmor
sudo systemctl restart apparmor.service
# Check Apparmor logs
sudo aa-log
# Check Apparmor status
sudo aa-status