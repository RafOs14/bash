#!/bin/bash

function _menuPrincipal(){
    clear
    echo ""
    echo -e " \e[10m======== Ventana de Respaldos =========\e[0m"
    echo -e "           \e[1;37m1 - Comprimir\e[0m"  
    echo -e "           \e[1;37m2 - Descomprimir\e[0m"  
    echo -e "           \e[1;37m3 - Empaquetar\e[0m"
    echo -e "           \e[1;37m4 - Desempaquetar\e[0m"
    echo -e "           \e[1;32m0 - Menu Principal\e[0m"
    echo -e " \e[10m=======================================\e[0m"
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
            ./Script/comprimir.sh
         ;;          
        2)
            ./Script/descomprimir.sh  
         ;; 
        3)
            ./Script/empaquetar.sh
         ;;                
        4)
            ./Script/desempaquetar.sh
        ;;
        0)
            ./menu-principal.sh
         ;;        
        *) echo -e "\e[1;31mOpcion no valida, ingrese otra opcion\e[0m"
        sleep 2
         ;;
    esac
done