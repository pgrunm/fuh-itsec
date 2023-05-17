# WireGuard installieren
sudo apt install wireguard

# privater und öffentlicher Schlüssel für den Server:
wg genkey | tee server_privatekey | wg pubkey > server_publickey
# privater und öffentlicher Schlüssel für den Client1:
wg genkey | tee client1_privatekey | wg pubkey > client1_publickey

# Konfigurationsdatei für den WireGuard-Server:
sudo nano /etc/wireguard/wg0.conf

### Inhalt
# [Interface]
# Address = SERVER_IP/24 (10.0.2.11/24)
# PrivateKey = SERVER_PRIVATE_KEY
# ListenPort = 51820 (standard Port für WireGuard)
# [Peer]
# PublicKey = CLIENT1_PUBLIC_KEY
# AllowedIPs = CLIENT1_IP/32 (10.0.2.12/32)
### Inhalt Ende


# Aktivieren und Starten des WireGuard-Servers
sudo systemctl enable wg-quick@wg0
sudo systemctl start wg-quick@wg0

# Konfigurationsdatei für den WireGuard-Client1:
sudo nano /etc/wireguard/wg-client1.conf
# Inhalt
# [Interface]
# Address = CLIENT_IP/32 (10.0.2.12/32)
# PrivateKey = CLIENT1_PRIVATE_KEY
# DNS = 1.1.1.1, 8.8.8.8
# [Peer]
# PublicKey = SERVER_PUBLIC_KEY
# Endpoint = SERVER_IP:SERVER_PORT (Public IP vom Router:51820) mit curl ifconfig.io herausfinden
# AllowedIPs = 0.0.0.0/0

# Starten des WireGuard-Clients, eventuell noch einen Dienst installieren:
sudo apt-get install resolvconf
sudo wg-quick up /etc/wireguard/wg-client1.conf
# Kontrollieren, ob die Verbindung funktioniert
sudo wg
sudo systemctl status wg-quick@wg0.service
sudo systemctl status wg-quick@wg-client1.service