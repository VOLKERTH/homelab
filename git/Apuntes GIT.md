# Vocabulario más utilizado

- **GIT:** Software de control de versiones.
- **GitHub/Bitbucket/GitLab:** Servidores remotos que alojan código.
- **PR (Pull Request):** A la hora de querer subir código o fusionar una rama con otra, se crea una petición que se tiene que aprobar.
- **Commit:** cada cambio que se sube, sería la subida de código al repositorio local.
- **Tag:** Etiqueta a modo referencia para indicar un hito o punto de control importante.
- **Branch:** Rama la cual tiene código, ya sea permanentes como main o develop, o temporales como features, funcionalidades, características, tasks, tareas...una vez finalizado suele fusionarse/merge a una rama principal.
- **Working Directory:** Tu carpeta de trabajo, del ordenador.
- **origin:** origen del código.
- **Local repo:** la carpeta de tu ordenador donde tienes el código.
- **Remote repo:** ubicación del código que te descargas o subes del servidor remoto (origin).
- **HEAD:** Puntero de donde te encuentras ahora mismo en el commit de la rama.
- **Hash:** ID del commit.

&nbsp;

# Fases a la hora de subir código

- **Modified:** Has modificado el archivo el archivo que estaba en tu Working Directory/Carpeta de tu PC.
- **Staged:** Al hacer git add del/de los archivos, preparado para subir al repo local.
- **Local Repo:** cuando ya has hecho commit.
- **Remote repo:** git push, lo subes a GitHub, Bitbucket, GitLab...

&nbsp;

# Metodologías más comunes

- **Gitflow:** Se utilizan normalmente dos ramas principales, **main** y **develop**. De develop se crean otras ramas para abarcar tareas/funcionalidades y al finalizar, se hacer merge a develop y de ésta, a main, aprobando las PRs. En definitiva, no se sube código de manera directa a la rama main.
- **Git Trunk-based:** Pensada para plantillas con poca rotación y developers seniors. Se trabaja principalmente subiendo código a la rama main.

&nbsp;

# Ramas mínimas recomendadas

- **main/master**: rama principal del repositorio.
- **develop:** Cada desarrollador debe crear una rama ya sea para sí mismo, para crear features o tareas. Se recomienda poner el número de ticket o la tarea que se está ejecutando.

&nbsp;

# Comandos más usados:

- **git clone:** Sirve para clonar el repositorio en nuestra ubicación, se necesita la URL del repositorio o las claves SSH y los permisos.
- **git fetch:** Checkea cuántos cambios hay en origin, pero no los descarga, te pregunta si quieres bajarlos.
- **git pull:** Hace lo mismo que git fetch, pero descarga automáticamente los cambios. MUY recomendado nada más empezar la jornada y antes de subir algún cambio para traerse los cambios de los compañeros.
- **git branch:** Consultar, crear o eliminar ramas...
    - \-a Añadir rama.
    - \-d Eliminar rama, si hay algún inconveniente, te informará.
    - \-D Eliminar de manera forzada la rama.
- **git add:** Añadir un archivo o la localización que indiques. Puedes añadir todo lo que haya en tu ruta actual (git add .), como en Linux para indicar tu ubicación actual (pwd).
- **git commit:** Subes el código a tu repositorio local.
    - Puedes usar -m "Mensaje a indicar", para poder hacer una breve explicación del cambio.
    - Si has hecho commit, te has equivocado en el mensaje y no has hecho push, puedes añadir --amend -m "Mensaje corregido".
- **git push:** Subes el código que tienes en el repositorio local al remoto, y los compañeros podrán descargar tus cambios.
- **git checkout:** Sirve para cambiar de rama, e incluso para posicionarnos en un commit.
- **git merge:** Fusiona una rama a la rama donde te encuentres ahora.
    - \--ff: FAST FORWARD o la opción por defecto si no se pone parámetros a git merge, añade los cambios al HEAD de manera directa, si ves un gráfico de commits, añade DIRECTAMENTE a lo más actual de la rama donde nos encontramos (sería la rama de color rosa DEVELOP que la integra desde ese commit a lo más actual en MAIN, la azul). git merge --ff develop  
        ![26a9ea2a6f6e2a2ee0de0ab1840fc3c5.png](../../_resources/26a9ea2a6f6e2a2ee0de0ab1840fc3c5.png)
    - \--no-ff: NO FAST FORWARD, el merge crea una rama (VERDE de la primera imagen) con este cambio a la rama que indiques. git merge --no-ff develop. Después, en la segunda imagen, fusiona la rama VERDEa la rama develop ROSA, y finalmente a la AZUL que es MAIN.  
        ![b5b7535fccf0144352bb435466a70339.png](../../_resources/b5b7535fccf0144352bb435466a70339.png) ![d4115f3f34d6a594b097e12add4ee18f.png](../../_resources/d4115f3f34d6a594b097e12add4ee18f.png)
- **git log:** Para hacer seguimiento de los cambios.
- **git diff:** Compara diferencias entre un commit y tu código.
- **git status**: Podemos ver información de en qué commit nos encontramos y posición del HEAD
- **git stash**: Hace de portapapeles con cambio en MODIFIED o STAGED. Para "pegar" el portapapeles y eliminar esa "caché", **git stash pop**.

&nbsp;

# Otros comandos más situacionales

- **git tag:** Se crea una etiqueta a modo marcapáginas/referencia, ligado a un commit para señalar hitos como la release V.1.0.1 que salió a producción.
- **git revert:** deshace un commit/cambio, conserva los posteriores (En el ejemplo, un dev quitó un botón del código, y se decide que deshacer ese cambio, es la mejor opción. Después hacer el procedimiento habitual, git push, git checkout si procede porque es otra rama, git merge...).
- **git reset:** Volver atrás en el tiempo (Cambios después desde ese commit). Se requiere previo backup de los cambios si se dese reutilizar código a posteriori.
    - \--hard: Elimina TODO LO POSTERIOR
    - \--hard HEAD^: Incluye el símbolo del triángulo hacia arriba, es para deshacer el último commit SIEMPRE QUE NO SE HAYA HECHO GIT PUSH.
- **git cherry-pick:** Seleccionas un commit y lo mueves arriba del todo en la gráfica, es el nuevo punto de referencia desde que se va a partir de aquí en adelante.  La comparación es que has cogido la cereza/guinda y la has puesto encima del pastel (repo)

&nbsp;

# Prácticas recomendadas

- A la hora de hacer un commit, puedes añadir dos parámetros -m, para que uno haga de título y el otro con una breve descripción
- Antes de subir código, hacer pull con los cambios de los compañeros.
- Habilitar si procede que se eliminen ramas que no son principales, como las features, marcar el check **Automatically delete head branches**

<img src="../../_resources/e640596a6cf56089c32d4d1acabebed1.png" alt="e640596a6cf56089c32d4d1acabebed1.png" width="538" height="581" class="jop-noMdConv">

- Impedir que se hagan commits a main directamente, o que se borren del main (Ruleset)

<img src="../../_resources/b572c91e716452e5037bfb066b2057f1.png" alt="b572c91e716452e5037bfb066b2057f1.png" width="541" height="518" class="jop-noMdConv">

&nbsp;

# Fases de cero a subir nuestro código (Principiante)

En este escenario, estás en un tutorial o curso de GIT y partimos del punto que no tenemos código ni lo hemos creado, nos descargamos el recurso que nos indica el vídeo y terminaremos subiendo el código a nuestra cuenta de GitHub.

1.  Crear una carpeta donde clonaremos el repositorio.
2.  Clonamos/Descargamos el repositorio: git clone https://URL_REPO.
3.  Modificamos, añadimos código o archivos (Pasan los archivos al estado MODIFIED).
4.  Añadimos los archivos modificados: "git add archivo1.php archivo2.css" o si lo queremos, "git add .", para añadir todo lo que hay en nuestra ruta actual (Pasamos a la fase STAGED).
5.  Revisamos que todo esté correcto en STAGED (los archivos que hemos añadido, preparados para hacer el commit), si todo está correcto, git commit -m "Título" -m "Descripción breve" (Fase de subir los cambios al repo local, tu carpeta).
6.  Último paso para subir tus cambios del repositorio local al servidor/repositorio remoto, git push origin main (o master, depende de la rama). Aquí seguramente te pida iniciar sesión con credenciales, token o SSH y comprobar que estás autorizado a subir código a este repositorio.

&nbsp;

# Fases de cero a subir nuestro código con buenas prácticas y metodología GitFlow (Intermedio)

Aquí el escenario es distinto, ya tienes algo de conocimiento o contexto subiendo código, ya no estamos subiendo código a nuestro repositorio de pruebas, ahora colaboramos en un equipo y un repositorio compartido.

1.  Crear una carpeta donde clonaremos el repositorio.
2.  Clonamos/Descargamos el repositorio: git clone https://URL_REPO.

Esta parte anterior, ya la damos por hecho anteriormente.

1.  Traemos los cambios de los compañeros con git pull si lo queremos sin que nos pregunte.
2.  Modificamos, añadimos código o archivos (Pasan los archivos al estado MODIFIED).
3.  Añadimos los archivos modificados: "git add archivo1.php archivo2.css" o si lo queremos, "git add .", para añadir todo lo que hay en nuestra ruta actual (Pasamos a la fase STAGED).
4.  Revisamos que todo esté correcto en STAGED (los archivos que hemos añadido, preparados para hacer el commit), si todo está correcto, git commit -m "Título" -m "Descripción breve" (Fase de subir los cambios al repo local, tu carpeta).
5.  Descargamos de nuevo cambios para no pisar los cambios que han hecho los compañeros con git pull. Si trabajas tú solo en esta rama, podrías obviar este paso.
6.  Subir tus cambios del repositorio local al servidor/repositorio remoto, git push desde la rama de la feature/task.
7.  Cambiamos a la rama **QUE VA A RECIBIR LOS CAMBIOS (DESTINO, por ejemplo, DEVELOP, con git branch develop).**
8.  Traemos los cambios de otros compañeros que hayan hecho en esta rama con git pull.
9.  Fusionamos los cambios de la rama **feature** al terminar la nueva funcionalidad o corrección, git merge feature. SE CREARÁ UNA PR.
10. Acto seguido, hacemos lo mismo si procede con main. Vamos a la rama con git branch main.
11. Traemos los cambio con git pull ya estando en main.
12. Fusionamos los cambios de DEVELOP a MAIN, con git merge develop. SE CREARÁ UNA PR.