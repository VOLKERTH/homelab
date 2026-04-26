# APACHE
```
<VirtualHost *:443>

        ServerName www.web1.com
        ServerAlias web1.com
        DocumentRoot /var/www/html/web1/

        SSLProtocol -all +TLSv1.2 +TLSv1.3
        SSLCipherSuite HIGH:!aNULL:!MD5:!RC4

        SSLCertificateFile /etc/ssl/certs/web1.com.crt  
        SSLCertificateKeyFile /etc/ssl/private/web1.com.key

        ErrorLog ${APACHE_LOG_DIR}/error.log
        CustomLog ${APACHE_LOG_DIR}/access.log combined

        <Directory /var/www/html/web1/admin>
                Require ip 10.168.0.0/24
               AuthType Basic  
               AuthName "Area restringida"  
               AuthUserFile /opt/htpasswd-web1  
               Require valid-user
        </Directory>

</VirtualHost>
```
## Este VirtualHost está configurado para que atienda por HTTPS y proteger el directorio admin con un rango en específico de IPs y autenticación básica (usuario/contraseña)i

Si se quiere añadir Proxy Inverso, puedes añadir:
        ProxyPreserveHost On
        ProxyPass /api http://localhost:8000/
        ProxyPassReverse /api http://localhost:8000/

(activar con a2enmod: proxy, proxy_http) SI se trabaja con Python proxy_uwsgi, con PHP es proxy_fastcgi y Apache Tomcat es AJP, de terceros Y USA EL PUERTO 8009, NO EL 8080.


Si queremos permitir que se pueda cambiar configuración a través de .HTACCESS, añadir:
```
        <Directory /var/www/html/web1/admin>
                AllowOverride All
        </Directory>
```

(Cambiar la ruta a la que corresponda, y añadir el .htaccess a la misma ruta)

## Ejemplo de .htaccess para redirigir cuando apuntan a un directorio que ya no existe, se ha movido:
```
Redirect 301 "/blog/" "/articulos/"
```
## Ejemplo de pedir una imagen https://web1.com/tux.jpg -> https://web1.com/img/tux.jpg
Redirectmatch 301 ^/(?!img/)(.*)\.jpg$ /img/$1.jpg



# NGINX

## 