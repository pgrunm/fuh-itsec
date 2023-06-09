To configure Apache as a reverse proxy, follow these steps:

1. Install Apache: Install Apache on your server if it's not already installed.

2. Enable mod_proxy: Enable the mod_proxy module by entering the following command in the terminal:

```
sudo a2enmod proxy
```

3. Create a virtual host: Add a new virtual host configuration in Apache for the domain you want to use as a reverse proxy. This can be done by creating a new virtual host file in "/etc/apache2/sites-available" directory. For example, create a file named "example.com.conf" with the following content:

```
<VirtualHost *:80>
ServerName example.com
ProxyPass / http://localhost:8080/
ProxyPassReverse / http://localhost:8080/
</VirtualHost>
```

4. Restart Apache: Restart Apache for the changes to take effect.

```
sudo service apache2 restart
```

5. Done: Your Apache server is now configured as a reverse proxy. Any requests to `http://example.com` will be forwarded to `http://localhost:8080`.