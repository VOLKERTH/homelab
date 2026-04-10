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


# NGINX