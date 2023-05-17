# Erstellen Verzeichnis für benutzerdefinierte AppArmor-Profile:
sudo mkdir /etc/apparmor.d/local

# Erstellen AppArmor-Profil für den Apache2-Webserver. Erstellen neue Datei unter
# /etc/apparmor.d/local mit dem Namen usr.sbin.apache2
# AppArmor profile for Apache2
#include <tunables/global>
profile /usr/sbin/apache2 {
# Allow read access to the Apache configuraƟon files
/etc/apache2/ r,
/etc/apache2/** r,
# Allow read/write access to the Apache logs
/var/log/apache2/ rw,
/var/log/apache2/** rw,
# Allow access to the Apache server root directory
/var/www/ r,
/var/www/** r,
# Allow network access for Apache
network tcp,
}
#Erstellen ein AppArmor-Profil für die MySQL-Datenbank. Erstellen neue Datei unter
/etc/apparmor.d/local mit dem Namen usr.sbin.mysqld
# AppArmor profile for MySQL
#include <tunables/global>
profile /usr/sbin/mysqld {
# Allow read access to the MySQL configuraƟon file
/etc/mysql/my.cnf r,
# Allow read/write access to the MySQL data directory
/var/lib/mysql/ rw,
/var/lib/mysql/** rw,
# Allow network access for MySQL
network tcp,
}
#AkƟvieren benutzerdefinierten AppArmor-Profile FRAGLICH
sudo apparmor_parser -r /etc/apparmor.d/local/usr.sbin.apache2
sudo apparmor_parser -r /etc/apparmor.d/local/usr.sbin.mysqld
#einen automaƟsches Profil von apache2 erstellen und scanen drücken
sudo aa-genprof apache2
#danach im webbrowser die fernuni seiten besuchen und alle AkƟonen ausführen,
#danach zurück zum Profil und durchklicken die Rechte die benöƟgt werden.
#AppArmor status kontrollieren
sudo apparmor_status
#AppArmor Log Dateien
/var/log/kern.log