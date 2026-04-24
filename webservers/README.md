# Seguridad y cifrado

- **Cifrado extremo a extremo** (Cifrar el canal)

- **Cifrado simétrico y asimétrico** (Cifrar el contenido / la información)

  - **Cifrado simétrico**
    - **VENTAJAS**
      - Eficiencia: Rápido y eficiente, ya que utiliza una única clave.
      - Sencillo: Fácil de implementar y utilizar.
      - Grandes volúmenes de datos: Ya que es más rápido y eficiente en el procesamiento de grandes archivos.
    - **DESVENTAJAS**
      - Intercambio de claves: Si la clave se ve comprometida, todos los datos cifrados estarán dispuestos.
      - Poco escalable: Difícil de administrar y distribuir las claves de forma segura entre gran cantidad de los usuarios.
      - Falta de autenticación: No se puede garantizar la identidad del remitente.

  - **Cifrado asimétrico**
    - **VENTAJAS**
      - Seguridad en el intercambio de claves: clave pública para cifrar los datos y una privada correspondiente para descifrarlos.
      - Autenticación y firma digital: Lo que garantiza la identidad del remitente y la integridad de los datos.
      - Escalabilidad: Es más fácil de usar con muchos usuarios, ya que cada usuario solo necesita su propia clave pública.
    - **DESVENTAJAS**
      - Rendimiento y recursos: Es mucho más lento y requiere más recursos computacionales que el cifrado simétrico.
      - Limitaciones en grandes volúmenes de datos: Puede no ser eficiente para cifrar grandes volúmenes de datos.
      - Complejidad: La implementación y gestión de claves públicas y privadas puede ser más compleja que en el caso del cifrado simétrico.

  - **Algoritmos de cifrado simétrico**
    - **DES**
        - Clave efectiva de 56bits.
        - Variante 3DES con más potencia, pero muy lento.
    - **IDEA**
        - Clave de 128 bits.
        - Más rápido y difícil de descifrar que DES.
    - **AES**
        - Claves de 128, 192 y 245 bits.
        - Es el más usado.
    - **Blowfish**
        - Clave 32 a 448 bits.
        - Variante Twofish.
        - No se popularizaron.
        - Código abierto.
    - **Riverst Cipher**
        - Varias versiones que no tuvieron éxito, de RC1 a RC6.
  
  - **Algoritmos de cifrado asimétrico**
    - **RSA**
        - Basado en la factorización de números enteros grandes.
        - Permite el cifrado y descifrado, así como la firma y verificación digital.
        - Utilizado en SSL / TLS.
        - Requiere claves largas.
        - Puede ser lento.
    - **DIFFIE-HELLMAN**
        - Utilizado para acordar una clave secreta en una comunicación insegura.
        - No se utiliza directamente para el cifrado.
        - Resiliente a ataques de escucha en redes no seguras.
        - Variantes como el Diffie-Hellman de curva elíptica (ECDH).
    - **ECC (ELIPTIC CURVE CRUPTOGRAPHY)**
        - Misma seguridad con claves más cortas.
        - Requiere menos recursos.
        - Popular en dispositivos móviles y sistemas embebidos.
        - Es ampliamente utilizado en protocolos de seguridad como el cifrado de comunicaciones TLS-1.3.


- **PFS (Perfect Forward Secrecy)**
  - Es un principio criptográfico que garantiza la confidencialidad de las comunicaciones, incluso si las claves privadas utilizadas para cifrar los datos se ven comprometidas.
  - Se generan claves de sesión únicas y temporales para cada conexión. Estas claves de sesión se generan mediante algoritmos de intercambio de claves efímeras que permiten que los participantes acuerden una clave sin necesidad de compartirla directamente.

- **PKI (Public Key Infrastructure)**
  - Certificación y autenticación: Emite certificados digitales que garantizan la identidad y autenticidad de los participantes en la comunicación, permitiendo verificar la integridad de los datos y establecer conexiones seguras.
  - Gestión de claves: Administra y controla la generación, almacenamiento y distribución de claves criptográficas utilizadas en sistemas de cifrado asimétrico.
  
  - **Entidad Certificadora (CA - Certificate Authority)**
    - Tipos:
      - Autoridad de Certificación Raíz: Es la entidad certificadora de nivel superior en una PKI. Emite y firma certificados para otras entidades certificadoras, creando una cadena de confianza.
      - Autoridad de Certificación Subordinada (Intermediate CA): Emiten certificados para usuarios finales, dispositivos y otros servicios dentro de una PKI.

    - Funciones:
      - Emisión de certificados: Verifica la identidad y autenticidad de una entidad solicitante y emite un certificado digital que la identifica.
      - Firma de certificados: La CA utiliza su clave privada para firmar digitalmente los certificados emitidos.
      - Renovación de certificados: Si se detecta algún problema de seguridad o se comprimete la clave privada de una entidad certificada, la CA puede revocar el certificado.

- **CSR (Certificate Signing Request)**
  - Es un mensaje enviado por un solicitante a una autoridad de registro de la PKI para solicitar un certificado de identidad digital.
    - Genera una clave privada y una clave pública
    - Úsalas para crear una CSR proporcionando la información requerida, como es el nombre de dominio y otros detalles.
    - Envía la CSR a una CA para que firme el certificado.

- **Estructura de un certificado digital, el estándar X.509**
  - Un certificado digital es una credencial utilizada para autenticar la identidad de una persona o entidad en el entorno digital.
    - Subject (sujeto): Identifica a la identidad o sujeto al que se emite el certificado.
    - Issuer (emisor): Es la entidad emisora CA.
    - Validity (validez): Es el campo que indica el período de tiempo durante el cual el certificado es válido.

- **ACME (Automated Certificate Management)**
  - Permite que un servidor web pueda comunicarse directamente con una CA para solicitar, validar y obtener un certificado, todo sin intervención humana. La parte más crítica de ACME es la validación de dominio para evitar suplantaciones de identidad.
    - Desafío HTTP-01: La CA te pide que sirvas un archivo específico con un nombre y contenido exactos en una URL determinada del dominio.
    - Desafío DNS-01: La CA te pide crear un registro de tipo TXT con un nombre y valor específicos.
- **SSL (Certificate Signing Request)**
  - SSL 2.0 y 3.0: Problema de vulnerabilidad POODLE que se aprovecha de una debilidad en el manejo dee un tipo de relleno del cifrado.
- **TLS (Certificate Signing Request)**
  - TLS 1.2 y 1.3: Mucho más robusto, mayor velocidad y seguridad al simplificar la negociación de la conexión y eliminar todos los algoritmos y cifrados inseguros.


# Apache

- Servidor web de código abierto que actúa como intermediario entre el navegador y los archivos de un sitio web. Maneja peticiones HTTP y sirve el contenido solicitado. La arquitectura es basado en un modelo de procesos padre-hijo. Un proceso padre con privilegios root lanza procesos hijos con menos privilegios por seguridad y estabilidad.
- **MPMs(Módulos de multiprocesamiento)**: Definen cómo Apache maneja las peticiones concurrentes. Solo uno puede estar activo a la vez.
  - **Prefork**: Modelo antiguo.Un proceso padre lanza procesos hijos, y cada proceso hijo maneja una conexión a la vez. Muy robusto pero consume más memoria.
  - **Worker**: Un proceso padre lanza varios procesos hijos y cada hijo gestiona múltiples hilos. Cada hilo maneja una conexión. COnsume menos memoria que Prefork.
  - **Event**: Es el MPM por defecto en distribuciones modernas. Similar a Worker, pero optimizado para manejar conexiones persistentes. Un hilo dedicado gestiona las conexiones en espera, liberando los hilos de trabajo para nuevas peticiones. Es el más escalable.


## Configuración de Apache

- **Archivos clave**:
  - **httpd.conf o apache2.conf**: Contiene la configuración global del servidor.
  - **sites-available/ y sites-enables/**: Estructura para gestionar sitios web de forma modular, con enlaces simbólicos para habilitar/deshabilitar.
  - **httpd.conf**: Permite configuraciones a nivel de directorio, pero puede afectar el rendimiento.


- **Comandos de gestión**:
  - **apache o apache2ctl**: Herramientas para controlar el demonio de Apache.
  - **apache start | stop | restart | graceful**: Inicia, detiene, reinicia entero Apache o reinicia manteniendo las conexiones con graceful.
  - **apachectl -t**: Prueba la sintaxis de la configuración antes de reiniciar, evitando fallos.
  - **httpd.conf**: Muestra la configuración de los hosts virtuales, muy útil para depurar.


- **¿Qué contienen los archivos de configuración**:
  - **Directivas globales**: Parámetros que afectan a todo el servidor, como el puerto en el que escucha, el usuario y grupo con el que se ejecuta el proceso, y el nombre del servidor.
  - **Directivas de módulos**: Define qué módulos de Apache se cargan al inicio. Los módulos son la clave de la modularidad de Pache, ya que añaden funcionalidades específicas.
  - **Inclusiones**: Esta es la directiva más importante para entender la arquitectura. En lugar de ponerlo todo en un solo archivo, httpf.conf incluye otros archivos y directorios de configuración. Esto organiza el trabajo y permite a los administradores activar o desactivar configuraciones de forma sencilla.

  - La organización modular. Los directorios más comunes:
    - **conf-available y conf-enabled (Debian/Ubuntu), o conf.d(RHEL)**: Contienen archivos de configuración para funcionalidades específicas.
    - **mods-available y mods-enabled (Debian/Ubuntu), o modules.d(RHEL)**: Aquí se define qué módulos están disponibles y cuáles están activos. Se cargan al inicio del servidor.
    - apachectl / apache2ctl: comandos para interaccionar con Apache

## Configuración de Apache

  - **a2enmod / a2dismod**: habilitar/deshabilitar módulos

  - **apachectl -t**: para probar cambios antes de aplicar

  - **apachectl -V**: Ver la configuración de Apache

## Virtualhost

VirtualHost Un contenedor que agrupa todas las directivas de configuración para un sitio web específico. Tipos:

 - **Basados en nombre**

 - **Basados en IP**

Conceptos dentro de VirtualHost:

 - **ServerName** El nombre de dominio principal para el virtual host

 - **ServerAlias** Nombres alternativos para el mismo virtual host, como el dominio sin prefijo www.

 - **DocumentRoot** La ruta el directorio del sistema de archivos donde se encuentran los archivos del sitio web.

 - **ErrorLog** y **CustomLog** Directivas para definir ubicaciones de registros de errores y acceso personalizados para cada host.

```
<VirtualHost \*:80>
        ServerName ejemplo1.com  
        ServerAlias www.ejemplo1.com  
        DocumentRoot /var/www/ejemplo1/public.html  
        ErrorLog /var/www/ejemplo1/logs/error.log  
        CustomLog /var/www/ejemplo1/logs/access.log combined  
</VirtualHost>
```

## Configuración HTTPS

 - Activar módulo SSL a2enmod ssl  
 - Configurar el VirtualHost para que escuche el 443  
 - Directivas para la habilitación de HTTPS:  
    - SSLEngine on Activa el motor SSL/TLS para el VirtualHost  
    - SSLCertificateFile Especifica la ruta al archivo del certificado del servidor  
    - SSLCertificateKeyFile Especifica la ruta del archivo de la llave privada  
    - SSLCertificateChainFile Una directiva que apunta al certificadom intermedio. Obsoleta desde 2.4.8

```
<VirtualHost \*:443>
        ServerName secure.ejemplo.com  
        DocumentRoot /var/www/secure.ejemplo.com  
        SSLEngine on  
        SSLCertificateFile /etc/ssl/certs/secure_ejemplo_com.crt  
        SSLCertificateKeyFile /etc/ssl/private/secure_ejemplo_com.key  
</VirtualHost>
```

## Hardening TLS
  
SSLProtocol Especificar los protocolos que se permiten  
    - SSLProtocol -all +TLSv1.2 +TLSv1.3  
    - SSLCipherSuite Permite especificar los algoritmos de cifrado para conexiones seguras  
    - SSLCipherSuite HIGH:!aNULL:!MD5:!RC4 (Solo cifrados fuentes HIGH, sin NULL, sin MD5 y sin RC4)

## Control de acceso por IP/Host

mod_auth_host Controla el acceso basado en nombre de host, la dirección IP o la red de cliente. Se configura por VirtualHost o .htaccess  
        Require all granted Permite acceso a todos  
        Require all denied Deniega el acceso a todos  
        Require ip 192.168.1.0 Permite el acceso desde esta red  
        Require host ejemplo.com Permite el acceso a este host específico
```
<Directory /var/www/dominio1/admin>
        Require ip 192.168.1.0/24  
        Require ip 203.0.113.5  
</Directory>
```
```
<Directory /var/www/>
        Require all granted  
        Require not ip 198.51.100.123  
</Directory>
```

  - mod_auth_basic Define el tipo de autenticación  
  - AuthType Basic Define el tipo de autenticación  
  - AuthName "Área restringida" El texto que se muestra en el cuadro de login  
  - AuthUserFile /ruta/a/.htpasswd La ruta al archivo de contraseñas  
  - Require valid-user Requiere que el usuario esté en el AuthUserFile

``` 
  - sudo htpasswd -c /etc/apache2/.htpasswd-usuarios.ejemplo juanperez  (Primera vez    para crearlo con -c)
  - sudo htpasswd /etc/apache2/.htpasswd-usuarios.ejemplo juanperez
```
```
<Directory /var/www/ejemplo1.com/public_html/admin>
        AuthType Basic  
        AuthName "Acceso para Administradores"  
        AuthUserFile /etc/apache2/.htpasswd-usuarios.ejemplo  
        Require valid-user  
</Directory>
```
## Archivo .htaccess

  - Son ficheros de configuración distribuida que aplican reglas por directorio
  - Muy usados en hosting compartido, donde los usuarios no pueden editar **httpd.conf**
  - Permiten habilitar PHP, redirecciones, autenticación, restricciones, etc.
  - Rendimiento: Apache busca ,htaccess en cada directorio de la ruta en cada petición  -> **Puede ralentizar**
  - Recomendación oficial: si se tiene acceso al archivo principal, mejor usar bloques <Directory> por claridad y eficiencia.
  - **AllowOverride** (en la config principal) define qué se permite en .htaccess:
    - **None**: deshabilita .htaccess
    - **All**: Permite todas las directivas
    - Valores específicos: como AuthConfig, Limit, etc. para control granular
  

## Redirecciones

**RedirectMatch** es una variante que acepta expresiones regulares en la URL de* origen, útil para patrones más flexibles (viene con mod_alias también). Ejemplo: "/docs/(.*)\.html$" "/documentation/$1.htm"

Con **mod_rewrite** se usa normalmente dentro de un bloque **RewriteEngine On** con reglas **RewriteRule**. Esto ofrece un control más fino, condicionales, etc.

Por ejemplo, forzar HTTPS con mod_rewrite:
```
RewriteEngine On
RewriteCond % (HTTPS) off
RewriteRule ^/(.*)$ https://%(HTTP_HOST)/$1 [R=301,L]
```

**NOTA**: Muchos framerworks web proporcionan archivos .htaccess con reglas mod_rewrite para gestionar URLs "amigables". Es por eso que en hosts compartidos a veces se activa AllowOverride FileInfo para permitir mod_rewrite en .htaccess.

## Proxy Inverso

Apache puede funcionar como proxy inverso mediante mod_proxy y módulos asociados (PHP-FPM -> mod_proxy_fcgi, Python (WSGI) -> mod_wsgi, Tomcat (AJP) -> mod_proxy_ajp, mod_proxy_balancer)

Su tarea es recibir peticiones, reenviarlas a servidores backend y devolver la respuesta al cliente, actuando como gateway.
Usos: balanceo de carga, ocultar aplicaciones tras un frontal, servir múltiples servicios bajo un mismo dominio.
Configuración básica: habilitar los módulos y usar directivas ProxyPass y P
```
ProxyPassReverse. Ejemplo:
ProxyPass "/api" "http://localhost:5000/"
ProxyPassReverse "/api" "http://localhost:5000/"
```

Esto permite que las peticiones a https://midominio/api/ se redirijan internamente a http://localhost:5000/ manteniendo la URL pública.

## Rendimiento y log

Al arrancar, **StartServers** define los procesos iniciales.
Con MPM **prefork** se usan **MinSpareServers** y **MaxSpareServers** para controlar procesos ociosos.
En **worker/event** se gestiona con **MinSpareThreads** y **MaxSpareThreads**, y con **ThreadsPerChild**.

El parámetro central es **MaxRequestWorkers** que marca el máximo de peticiones concurrentes.
En **prefork** la relación es 1 proceso = 1 cliente.
En **worker/event** se multiplican los procesos x hilos.

**MaxConnectionsPerChild (o MaxRequestPerChild)** controla cuántas peticiones atiende un proceso antes de reciclarse, para evitar fugas de memoria. Otros límites son **ServerLimit** o **ThreadLimit**, solo se ajustan al automentar valores máximos.

En la práctica, se calcula el promedio de memoria por proceso y se ajusta **MaxRequestWorkers** en función de la RAM. La herramienta **mod_status** permite verificar en tiempo real si los workers activos y ociosos corresponden al ajuste hecho.

**Error log**: Registra mensajes de error, alertas y advertencias del servidor, así como diagnósticos importantes.
En Debian por defecto está en **/var/log/apache2/error.log**
En CentOS **/var/log/httpd/error.log**

**Access Log**: Registra cada petición HTTP que el servidor atiende, junto con información como IP cliente, fecha, URL solicitada, código de respuesta, tamaño de respuesta y user-agent del cliente y referer.
La ubicación del access log se configura con CustomLog:
```
CustomLog "/var/log/apache2/access.log" combined 
```

(Combined es un formato definido por Apache que viene bastante completo el log)
```
%h %l %u %t \"%r\" %>s %b \"%(Referer)i\" \"%{User-Agent}i\"
```

## Módulos de seguridad

  - **mod_security**: Funciona como un firewall de aplicaciones web (WAF) con reglas para detectar SQL Injection, XSS y exploits conocidos. Usa directivas como **SecRuleEngine On** y reglas propias o de OWASP CRS. Puede bloquear, registrar o limpiar peticiones.
  - **mod_evasive**: Protege frente a ataques Dos/DDos básicos. Sus parámetros clave son DOSPageCount, DOSSiteCount, DOSBlockingPeriod, DOSEmailNotify. Configuración en **/etc/apache2/mods-available/evasive.conf** o **/etc/httpd/conf.d/mod_evasive**.



# NGINX

NGINX es un servidor web y proxy inverso de alto rendimiento, diseñado para manejar grandes cantidades de conexiones concurrentes de forma eficiente. NGINX a comparación de Apache utiliza un modelo asíncrono y basado en eventos, lo que hace que sea muy ligero en consumo de recursos y adecuado para microservicios.

Se utiliza ampliamente para:

  - Servir contenido estático
  - Balanceo de carga y proxy inverso
  - Soporte de HTTPS/TLS
  - Integración con aplicaciones mediante FastCGI, WSGI o AJP
  - Control de acceso y autenticación básica

## Arquitectura de NGINX

  - Master process: se encarga de leer los ficheros de configuración, abrir sockets de red y lanzar procesos trabajadores.
  - Worker processes: manejan las conexiones de los clientes. Todas trabajan de manera no bloqueante y en paralelo.
  - Módulos: funcionalidades cargadas de manera estática (no dinámica como en Apache)
  - Eventos: NGINX utiliza un bucle de eventos (epoll en Linux) para gestionar múltiples conexiones con pocos procesos.

## Archivos principales:

  - **/etc/nginx/nginx.conf**: fichero de configuración global.
  - **/etc/nginx/sites-available**: configuraciones de sitios virtuales (en Debian/Ubuntu)
  - **/etc/nginx/sites-enabled**: enlaces simbólicos a los sitios activos.
  - **/var/log/nginx/access.log**: log de accesos.
  - **/var/log/nginx/error.log**: log de errores.

## Virtualhost

```
server {
  listen 192.0.2.7:80;
  root /var/www/mi-web/html;
  index index.html
  server_name mi-web.com;
  location / {
    try_files $uri $uri/ =404;
  }
}
```
```
server {
  listen 80;
  listen [::]:80;
  root /var/www/mi-web/html;
  index index.html index.html;
  server_name mi-web.com www.mi-web.com;
  location / {
    try_files $uri $uri/ =404;
  }
}
```

## HTTPS

Configuración básica:

```
server  {
  listen                443 ssl;
  server_name           www.mi-web.com

  ssl_certificate       /etc/nginx/certs/www.mi-web.com.crt;
  ssl_certificate_key   /etc/nginx/certs/www.mi-web.com.key;

  ssl_protocols         TLSv1.2 TLSv1.3;
  ssl_ciphers           HIGH:!aNULL:!MD5;

}
```

## Redireccionar HTTP a HTTPS

```
server  {
  listen                443 ssl;
  server_name           www.mi-web.com
  return 301 https://$host$request_uri;
}
```

## SNI (Server Name Indication)

Antiguamente, un problema de HTTPS era que sin SNI, no se podían servir múltiples sitios HTTPS en una sola IP porque negociaba el certificado antes de saber el host solicitado.

SNI es una extensión de TLS que soluciona esto permitiendo que el cliente indique el hostname al iniciar la conexión cifrada.

Gracias a SNI, NGINX puede presentar diferentes certificados según el nombre de host solicitado.

## Logs

  - **access_log** /var/log/nginx/mi-web.access.log custom;
  - **error_log** /var/log/nginx/mi-web.error.log;
  - **log_format**: Permite definir formatos de log personalizados utilizando las variables de NGINX.

## Restricción de acceso: control por IP

```
location /admin/ {
  deny all;
  allow 192.168.1.10;
  allow 10.0.0.0/24;
}
```

Importante: **El orden de las reglas allow y deny importa**, las procesa en orden.

## Autenticación HTTP básica

Para crear el fichero de contraseña, se utiliza la misma utilidad que en apache: htpasswd

Configurar NGINX:

```
location /privado/ {
  auth_basic "Área Restringida";
  auth_basic_user_file /etc/nginx/.htpasswd;
}
```

## Redirecciones con NGINX

  - **return**: La forma más simple de redirigir. Permite devolver directamente un código de estado y una URL destino:



  - -**rewrite**: Una directiva más poderosa que permite usar expresiones regulares para reemplazar partes de la URL y decidir si hacer redirección o reescritura interna.
    - Sintaxis: rewrite <regex> <replacement> [flag];
      ```
      rewrite ^/oldpath/(.*)$ /newpath/$1 permanent;
      ```
      El flag permanent devuelve el código 301, redirect es 302. También existen flags **last** y **break** para reescrituras internas sin cambiar codigo de respuesta.


## Proxy inverso con balanceo de carga

```
upstream backendcluster {
  server backend1.ejemplo.com weight=5;
  server backend2.ejemplo.com;
  server 192.0.2.50:3000 max_fails=3 fail_timeout=30s;
}
server {
  listen 80;
  server_name app.ejemplo.com;
  location / {
    proxy_pass http://backendcluster;
  }
}
```

## FastCGI

Para configurar NGINX con PHP, se suele añadir un bloque location que pase las peticiones php al FastCGI server.

Ejemplo en Debian de PHP-FPM crea un socket Unix **/run/php/phpX.X-fpm.sock**:

```
  server {
  listen 80;
  server_name tienda.com;
  root /var/www/tienda;
  index index.php index.html;

  location / {
    fastcgi_pass unix:/var/run/php/php8.2-fpm.sock;
    fastcgi index index.php
    include fastcgi_params;
    fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
  }
}
```

## WSGI (Python)

Protocolo uwsgi es la interfaz recomendada para conectar NGINX con aplicaciones Python. La directiva central es **uwsgi_pass**.
Crea un socket de dominio Unix **/var/run/uwsgi/app.sock**

```

  location / {
    uwsgi_pass unix:/var/run/uwsgi-app.sock;
    include uwsgi_params;
  }
```

## AJP (para servidores Java)

**AJP (Apache JServ Protocol)** ees un protocolo binario utilizado por servidores Java (como Apache Tomcat)
Por defecto, NGINX no soporta AJP de manera nativa.

Existe un módulo de tercero llamado nginx_ajp_module que se puede compilar con NGINX para habilitar **ajp_pass**, por el puerto 8009.

```
location / {
  ajp_pass 127.0.0.1:8009;
}
```

