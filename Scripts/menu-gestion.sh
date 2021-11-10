#!/bin/bash

function _menuPrincipal(){
    clear
    echo ""
    echo -e " \e[10m=============== Ventana De Gestion ===============\e[0m"
    echo -e "              \e[1;37m1 - Gestion de Usuarios\e[0m"
    echo -e "              \e[1;37m2 - Gestion de Grupos\e[0m" 
    echo -e "              \e[1;32m0 - Menu Principal\e[0m"
    echo -e " \e[10m==================================================\e[0m"
    echo ""
    read -p  "Por favor seleccione una opcion: 
"  opc    
    return $opc
}

while [[ $opc != 0  ]] 
do
    _menuPrincipal

    case $opc in 
        1)
             ./Script/usuarios.sh                
         ;;          
        2)
            ./Script/grupos.sh
         ;;
        0)
            ./menu-principal.sh                 
         ;;              
        *) echo -e "\e[1;31mOpcion no valida, ingrese otra opcion\e[0m"
            sleep 2
         ;;
    esac
done