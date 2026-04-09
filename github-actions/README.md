# ¿Qué es GitHub Actions?

Una solución de Integración Continua (CI), con la que podemos automatizar, personalizar y ejecutar flujos de trabajo para el desarrollo de software.
Formato utilizado, YAML.
Se localiza como .workflow, es decir una carpeta oculta en el repositorio.

# Vocabulario

- **Workflows:** Proceso automático que ejecuta uno o más jobs.
- **Events:** Hacen de "triggers" o "disparadores". Es una actividad específica que     acciona un workflow (una incidencia, un commit, un merge...)
- **Jobs:** Conjunto de acciones o tareas que contiene un workflow. Pueden ejecutarse en un orden deseado y si se configura, con dependencia de otro job.
- **Actions:** Aplicaciones personalizadas que ejecutan tareas repetitivas. (Playbooks del marketplace, como Ansible Galaxy).
- **Runners:** Las máquinas virtuales en las que se ejecutan los workflows. Cada runner ejecuta un solo trabajo al mismo tiempo. Se ejecuta cada workflow en máquinas nuevas aprovisionadas para esa acción. (Se define en el YAML qué sistema operativo se necesita para nuestra aplicación/integración).
- **Variables:** Como en todo lenguaje de programación, se pueden definir variables para ser reutilizadas todas las veces necesarias, y en el caso de cambiar un parámetro o nombre, ya estaba la variable definida en los lugares que corresponda.


## GitHub Actions Documentación
https://docs.github.com/es/actions

## GitHub Actions Marketplace
https://github.com/marketplace?type=actions

### Ejemplo de pipelines sencillos:
REPO1
REPO2
