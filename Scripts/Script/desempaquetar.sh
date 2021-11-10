#!/bin/bash

function _desempaquetar(){
    clear
    echo ""
    echo -e " \e[10m======== Ventana Desempaquetar =========\e[0m"
    echo -e "           \e[1;37m1 - Desempaquetar\e[0m"
    echo -e "           \e[1;32m0 - Volver\e[0m"  
    echo -e " \e[10m========================================\e[0m"
    echo ""
    read -p  "Por favor seleccione una opcion: 
"  opc    
    return $opc
}

while [[ $opc != 0 ]] 
do
    _desempaquetar

    case $opc in 
        1)
			#Limpiamos la pantalla con clear
            clear
            echo -e " \e[10m============ Desempaquetar ============\e[0m"
    		echo -e "      \e[1;37m	   Desempaquetar\e[0m"
			echo -e " \e[10m====================================\e[0m"
			#Pedimos al usuario que ingrese lo que quiere empaquetar (Archivo o directorio)
            read -p "Ingrese la ruta del archivo empaquetado: " ruta
            #Evaluamos si el usuario ingreso una ruta o dejo la misma vacia
            if [ -z "$ruta" ]
            then    
                echo -e "\e[1;31mLa ruta no puede estar vacia\e[0m"
                echo -e "\e[1;31mIngrese una ruta para poder continuar\e[0m"
                sleep 2
            else
            #Solicitamos el archivo o directorio a desempaquetar
            read -p "Ingrese el archivo tar a desempaquetar: " archivo
            #Validamos que el archivo ingresado exista, en caso contrario mostramos un mensaje de error
                if [ -f $ruta"/"$archivo ]
                then
                    cd /home/admin/Respaldos
                    sudo tar xvfz $ruta"/"$archivo 
                    echo
                    echo -e "\e[1;32mEl archivo ha sido desempaquetado de forma correcta en /home/admin/Respaldos\e[0m"  
                    sleep 2
                    echo
                else 
                    echo
                    echo -e "\e[1;31mEl archivo indicado no existe en la ruta indicada\e[0m"
                    sleep 2
                    echo
                fi
            fi									
         ;;          
        0)
            ./menu-respaldos.sh
         ;;         
        *) echo -e "\e[1;31mOpcion no valida, ingrese otra opcion\e[0m"
            sleep 2
         ;;
    esac
done