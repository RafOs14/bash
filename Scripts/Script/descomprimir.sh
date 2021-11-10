#!/bin/bash

function _descomprimir(){
    clear
    echo ""
    echo -e " \e[10m======== Ventana Descomprimir =========\e[0m"
    echo -e "           \e[1;37m1 - Descomprimir\e[0m"
    echo -e "           \e[1;32m0 - Volver\e[0m"  
    echo -e " \e[10m=======================================\e[0m"
    echo ""
    read -p  "Por favor seleccione una opcion: 
"  opc    
    return $opc
}

while [[ $opc != 0 ]] 
do
    _descomprimir

    case $opc in 
        1)
              #Limpiamos la pantalla con clear
			clear
			echo -e " \e[10m============ Descomprimir ============\e[0m"
    		echo -e "      \e[1;37m	   Descomprimir\e[0m"
			echo -e " \e[10m======================================\e[0m"
						
			#Con el comando gzip -d descomprimimos el archivo indicado por el usuario	
            read -p "Ingrese la ruta del archivo a descomprimir (ej: /home/admin): " ruta
            #Evaluamos si el usuario ingreso informacion en ruta, si no tiene informacion valida mostramos
			#el mensaje de error          
            if [ -z "$ruta" ]
			then	
				echo -e "\e[1;31mLa ruta no puede estar vacia\e[0m"
                sleep 2
				echo
			else				
			#Solicitamos el nombre del archivo a descomprimir y lo guardamos en una variable
				read -p "Ingrese el nombre del archivo: " archivo
            #Validamos que el archivo ingresado exista, en caso contrario mostramos un mensaje de error
                if [ -f $ruta"/"$archivo".gz" ]
                then
                    sudo gunzip -d $ruta"/"$archivo".gz"
                    echo                    
                    echo         
                    read -p "Ingrese la ruta del destino del archivo (ej: /home/admin): " ruta2           
                    #Movemos el archivo final a la carpeta home del usuario  
                    mv $ruta"/"$archivo $ruta2
                    echo -e "\e[1;32mArchivo descomprimido con exito en "$ruta2"\e[0m"
                    sleep 2
                    echo                    
                else 
                    echo -e "\e[1;31mEl archivo indicado no existe\e[0m"
                    sleep 2
                    echo                		
			    fi
            fi		                    
         ;;          
        0)
            ./menu-respaldos.sh
         ;;         
        *) echo -e "\e[1;31mOpcion no valida, ingrese otra opcion\e[0m"
         ;;
    esac
done