#!/bin/bash
# Script para realizar respaldos de forma manual, mostramos un menu a traves de una función, pedimos al usuario que ingrese
# una opción, la cual es usada para el case, y llamamos a la funcion en el while mientras que el usuario no vuelva a la 
# opción anterior o salga del script

#Utilizamos tar para empaquetar, con la opcion c creamos un paquete, f genera un archivo, v muestra el progreso, y z comprime
#Utilizamos rsync para espejar archivos y directorios, utilizamos la opcion a que abrevia varios parametros y v para mostrar el progreso
#En todos los casos le colocamos la fecha del día, para poder tener un control

function _menuRespaldos(){
    clear
    echo ""
    echo -e " \e[10m======== Ventana Respaldos =================\e[0m"
    echo -e " \e[1;31m======== Respaldos con TAR =================\e[0m"
    echo -e "       \e[1;37m1 - Respaldo etc  \e[0m"  
    echo -e "       \e[1;37m2 - Resplado var \e[0m"  
    echo -e "       \e[1;37m3 - Respaldo useradd \e[0m"
    echo -e "       \e[1;37m4 - Respaldo group \e[0m"
    echo -e "       \e[1;37m5 - Respaldo crontab \e[0m"
    echo -e "       \e[1;37m6 - Respaldo shadow \e[0m"
    echo -e "       \e[1;37m7 - Respaldo gshadow \e[0m"
    echo -e "       \e[1;37m8 - Respaldo passwd \e[0m"
    echo -e "       \e[1;37m9 - Respaldo login.defs \e[0m"
    echo -e "       \e[1;37m10 - Respaldo Configuración de red \e[0m"
    echo -e "       \e[1;37m11 - Respaldo scripts \e[0m"
    echo -e "       \e[1;37m12 - Respaldo home \e[0m"
    echo -e " \e[1;31m======== Respaldos con RSYNC =================\e[0m"
    echo -e "       \e[1;37m13 - Respaldo etc  \e[0m"  
    echo -e "       \e[1;37m14 - Resplado var \e[0m"  
    echo -e "       \e[1;37m15 - Respaldo useradd \e[0m"
    echo -e "       \e[1;37m16 - Respaldo group \e[0m"
    echo -e "       \e[1;37m17 - Respaldo shadow \e[0m"
    echo -e "       \e[1;37m18 - Respaldo gshadow \e[0m"
    echo -e "       \e[1;37m19 - Respaldo passwd \e[0m"
    echo -e "       \e[1;37m20 - Respaldo login.defs \e[0m"
    echo -e "       \e[1;37m21 - Respaldo Configuración de red \e[0m"
    echo -e "       \e[1;37m22 - Respaldo home \e[0m"
    echo -e "       \e[1;37m23 - Respaldo Scripts Proyecto \e[0m" 
    echo -e "       \e[1;37m24 - Respaldo Base de datos \e[0m"   
    echo -e "       \e[1;32m0 - Volver\e[0m" 
    echo -e " \e[10m============================================\e[0m"
    echo ""
    read -p  "Por favor seleccione una opcion: 
"  opc    
    return $opc
}

while [[ $opc != 0 ]] 
do
    _menuRespaldos

    case $opc in 
        1)
            #Empaquetar etc
            sudo tar cvfz /home/admin/Respaldos/backupetc" - "$(date +%d-%m-%Y) /etc
        ;;          
        2)
            #Empaquetar var
            sudo tar cvfz /home/admin/Respaldos/backupvar" - "$(date +%d-%m-%Y) /var 
        ;; 
        3)
            #Empaquetar useradd
            sudo tar cvfz /etc/default/backupuseradd" - "$(date +%d-%m-%Y) /etc/default/useradd
        ;;                
        4)
            #Empaquetar group
            sudo tar cvfz /home/admin/Respaldos/backupgroup" - "$(date +%d-%m-%Y) /etc/group            
        ;;
        5)
            #Empaquetar crontab
            sudo tar cvfz /home/admin/Respaldos/backupcrontab" - "$(date +%d-%m-%Y) /etc/crontab
        ;;
        6)
            #Empaquetar shadow
            sudo tar cvfz /home/admin/Respaldos/backupshadow" - "$(date +%d-%m-%Y) /etc/shadow
        ;;
        7)
            #Empaquetar gshadow
            sudo tar cvfz /home/admin/Respaldos/backupgshadow" - "$(date +%d-%m-%Y) /etc/gshadow
        ;;
        8)
            #Empaquetar passwd
            sudo tar cvfz /home/admin/Respaldos/backuppasswd" - "$(date +%d-%m-%Y) /etc/passwd
        ;;
        9)
            #Empaquetar login.defs
            sudo tar cvfz /home/admin/Respaldos/backuplogin.defs" - "$(date +%d-%m-%Y) /etc/login.defs 
        ;;
        10)
            #Empaquetar ifcfg-enp0s3
            sudo tar cvfz /home/admin/Respaldos/backup-ifcfg-enp0s3" - "$(date +%d-%m-%Y) /etc/sysconfig/network-scripts/ifcfg-enp0s3
        ;;
        11)
            #Empaquetar ScriptsProyecto
            sudo tar cvfz /home/admin/Respaldos/backupScriptsProyecto" - "$(date +%d-%m-%Y) /home/admin/ScriptsProyecto
        ;;
        12) 
            #Empaquetar home
            sudo tar cvfz /home/admin/Respaldos/backuphome" - "$(date +%d-%m-%Y) /home
        ;;

######################################## Respaldos con Rsync ###################################################

        13)
            #backup de etc 
            sudo rsync -av /etc /home/admin/Respaldos/backupetc" - "$(date +%d-%m-%Y)
        ;;
        14)
            #backup de var
            sudo rsync -av /var /home/admin/Respaldos/backupvar" - "$(date +%d-%m-%Y)
        ;;
        15)
            #backup de useradd 
            sudo rsync -av /etc/default/useradd /home/admin/Respaldos/backupuseradd" - "$(date +%d-%m-%Y)
        ;;
        16)
            #back up de group 
            sudo rsync -av /etc/group /home/admin/Respaldos/backupgroup" - "$(date +%d-%m-%Y)
        ;;
        17)
            #back up de shadow 
            sudo rsync -av /etc/shadow /home/admin/Respaldos/backupshadow" - "$(date +%d-%m-%Y)
        ;;
        18)
            #back up de gshadow 
            sudo rsync -av /etc/gshadow /home/admin/Respaldos/backupgshadow" - "$(date +%d-%m-%Y)
        ;;
        19)
            #back up de passwd 
            sudo rsync -av /etc/passwd /home/admin/Respaldos/backuppasswd" - "$(date +%d-%m-%Y)
        ;;
        20)
            #back up de login.defs
            sudo rsync -av /etc/login.defs /home/admin/Respaldos/backuplogin.defs" - "$(date +%d-%m-%Y)
        ;;
        21)
            #Backup archivo con configuraciones de red
            sudo rsync -av /etc/sysconfig/network-scrpts/ifcfg-enp0s3 /home/admin/Respaldos/backup-ifcfg-enp0s3" - "$(date +%d-%m-%Y)
        ;;
        22)
            #Backup de Home
            sudo rsync -av /home/admin/ /home/admin/Respaldos/backuphome" - "$(date +%d-%m-%Y)
        ;;
        23)
            #Backup de scripts de proyecto
            sudo rsync -av /home/admin/ScriptsProyecto /home/admin/Respaldos/backupScriptsProyecto" - "$(date +%d-%m-%Y)
        ;;
        24)
           #Backup de la base de datos del proyecto
            sudo mysqldump -u root -padmin  itisoftware > /home/admin/Respaldos/itisoftware.sql
            sudo rsync -av /home/admin/Respaldos/itisoftware.sql /home/admin/Respaldos/itisoftware.sql" - "$(date +%d-%m-%Y) 
        ;;        
        0)
            ./menu-principal.sh
        ;;        
        *) echo -e "\e[1;31mOpcion no valida, ingrese otra opcion\e[0m"
        sleep 2
         ;;
    esac
done