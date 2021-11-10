#!/bin/bash

function _salir(){
    clear
    echo " Ha elegido salir del programa"
    echo " Cerrando sesion..."
    sleep 2
    clear
    exit         
}

function _menuPrincipal(){
    clear
    echo ""
    echo -e " \e[10m=========================== Ventana Principal =============================\e[0m"
    echo -e "                     \e[1;37m1 - Administracion de Usuarios y grupos\e[0m"  
    echo -e "                     \e[1;37m2 - Comprimir y empaquetar\e[0m"  
    echo -e "                     \e[1;37m3 - Gestion de bases de datos\e[0m"
    echo -e "                     \e[1;37m4 - Respaldos Manuales\e[0m"
    echo -e "                     \e[1;37m5 - Respaldos Automaticos\e[0m"
    echo -e "                     \e[1;37m6 - Auditorias\e[0m"
    echo -e "                     \e[1;32m0 - Salir\e[0m"
    echo -e " \e[10m===========================================================================\e[0m"
    echo ""
    read -p  "Por favor seleccione una opcion: 
"  opc    
    return $opc
}

while [[ $opc != 0 ]] 
do
    _menuPrincipal

    case $opc in 
        1)
            ./menu-gestion.sh                
         ;;          
        2)
            ./menu-respaldos.sh  
         ;; 
        3)
            ./Script/respaldobbdd.sh
        ;;                
        4)
            ./Script/backupsmanuales.sh
        ;;
        5)
            ./backups.sh
        ;;
        6)
            ./menu-log.sh
        ;;
        0)
            _salir
        ;;
        *) echo -e "\e[1;31mOpcion no valida, ingrese otra opcion\e[0m"
            sleep 2
         ;;
    esac
done