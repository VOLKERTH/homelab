#!/bin/bash

# Colores
greenColour="\e[0;32m\033[1m"
redColour="\e[0;31m\033[1m"
yellowColour="\e[0;33m\033[1m"
endColour="\033[0m\e[0m"

# Función de actualización
update_discord(){

    # Buscamos el archivo y nos aseguramos de que solo coja uno
    DISCORD_VERSION=$(ls /home/smunoz/Downloads | grep discord | head -n 1 )

    echo -e "${yellowColour}[+] Descomprimiendo $DISCORD_VERSION...${endColour}"
    # Extraemos en la carpeta de descargas explícitamente
    tar -xzvf /home/smunoz/Downloads/$DISCORD_VERSION -C /home/smunoz/Downloads && \
    sleep 1

    echo -e "\n${yellowColour}[+] Creando backup...${endColour}"
    sudo rm -rf /opt/Discord_bck
    sudo mv /opt/Discord /opt/Discord_bck && \
    sleep 1

    echo -e "\n${yellowColour}[+] Instalando nueva versión...${endColour}"
    sudo rm -rf /opt/Discord && \
    sudo cp -R /home/smunoz/Downloads/Discord /opt/
}

# Función de limpieza (con bucle de validación)
delete_files() {
    while true; do
        echo -en "\n${yellowColour}[?] ¿Desea eliminar los archivos temporales? (y/n): ${endColour}"
        read respuesta

        case "$respuesta" in
            [Yy]* ) 
                sudo rm /home/smunoz/Downloads/$DISCORD_VERSION
                sudo rm -rf /home/smunoz/Downloads/Discord
                echo -e "\n${greenColour}[+] Archivos temporales eliminados correctamente.${endColour}"
                break ;;
            [Nn]* ) 
                echo -e "\n${yellowColour}[+] Los archivos se mantendrán en Descargas.${endColour}"
                break ;;
            * ) 
                echo -e "\n${redColour}[!] Por favor, responda 'y' o 'n'.${endColour}" ;;
        esac
    done
}

# --- FLUJO PRINCIPAL ---

# 1. Intentar actualizar
if update_discord; then
    echo -e "\n${greenColour}[✔️] Actualización finalizada con éxito.${endColour}"
    sleep 1
    
    # 2. Llamar a la limpieza (la pregunta ya está dentro de la función)
    delete_files
    
    echo -e "\n${greenColour}[+] Proceso completado. ¡Disfruta de Discord!${endColour}"
else
    echo -e "\n${redColour}[❌] Ha habido un fallo crítico, revise el output superior.${endColour}"
    exit 1
fi

