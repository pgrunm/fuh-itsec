# MySQL auf Ubuntu installieren
sudo apt install mysql-server python3-pip libmariadb-dev -y

# Notwendige Python Pakete installieren
sudo pip install mysql-connector install mysql-connector-python mariadb

# MySQL Server starten
sudo service mysql start

# Prüfung des Service mit:
sudo service mysql status
