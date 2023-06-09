#!/bin/bash
# Konfiguration des MySQL Backups
#Eine Scriptdatei namens mysql_backup.sh in /etc/mysql mit folgendem Inhalt erstellen
# MySQL credentials
MYSQL_USER="sergej"
MYSQL_PASSWORD="58tqxEJxqf123"
MYSQL_HOST="localhost"
MYSQL_DATABASE="messages"

# Backup directory
BACKUP_DIR="/etc/mysql/backup"
# Date and time
DATETIME=$(date +%Y-%m-%d_%H-%M-%S)
# Backup filename
BACKUP_FILENAME="backup-$DATETIME.sql"
# Full backup command

MYSQL_CMD="mysqldump --user=$MYSQL_USER --password=$MYSQL_PASSWORD --
host=$MYSQL_HOST $MYSQL_DATABASE > $BACKUP_DIR/$BACKUP_FILENAME"

# Create backup directory if it does not exist
mkdir -p $BACKUP_DIR
# Execute full backup command
$MYSQL_CMD
# Remove backups older than 7 days
find $BACKUP_DIR -type f -name "*.sql" -mƟme +7 -exec rm {} \;


### Weiteres Skript
#!/bin/bash
sudo mysqldump -u root messages > /etc/mysql/backup/backup_messages.sql
#ausführbar im verzeichnis machen und ausführen im Terminal
sudo chmod +x mysql_backup.sh
sudo ./mysql_backup.sh
#um regelmäsiges automaƟsches update zu machen in crontab eintragen
sudo crontab -e
0 18 * * * /etc/mysql/mysql_backup.sh
# Backup wird jeden Tag um 18 Uhr ausgeführt
