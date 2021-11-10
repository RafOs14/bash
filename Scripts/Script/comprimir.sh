#!/bin/bash

function _comprimir(){
    clear
    echo ""
    echo -e " \e[10m======== Ventana Comprimir =========\e[0m"
    echo -e "          \e[1;37m1 - Comprimir\e[0m"
    echo -e "          \e[1;32m0 - Volver\e[0m"  
    echo -e " \e[10m====================================\e[0m"
    echo ""
    read -p  "Por favor seleccione una opcion: 
"  opc    
    return $opc
}

while [[ $opc != 0 ]] 
do
    _comprimir

    case $opc in 
        1)
            #Limpiamos la pantalla con clear
			clear
			echo -e " \e[10m============ Comprimir ============\e[0m"
    		echo -e "      \e[1;37m	   Comprimir\e[0m"
			echo -e " \e[10m====================================\e[0m"
			#Pedimos al usuario que ingrese lo que quiere comprimir (Archivo o directorio)
			read -p "Ingrese la ruta a comprimir (ej: /home/admin): " ruta			
			#Con el comando gzip comprimimos el archivo indicado por el usuario
			#Evaluamos si el usuario ingreso informacion en ruta, si no tiene informacion valida mostramos
			#el mensaje de error
			if [ -z "$ruta" ]
			then	
                echo -e "\e[1;31mLa ruta no puede estar vacia\e[0m"
                sleep 2
			else			
			#Solicitamos el nombre del archivo a comprimir y lo guardamos en una variable
				read -p "Ingrese el nombre del archivo: " archivo
            #Validamos que el archivo ingresado exista, en caso contrario mostramos un mensaje de error               
                if [ -f $ruta"/"$archivo ]
                then                    
                    sudo gzip -f $ruta"/"$archivo
            #Movemos el archivo final a la carpeta de respaldos  
                    mv $ruta"/"$archivo".gz" /home/admin/Respaldos
				echo
                echo -e "\e[1;32mArchivo comprimido con exito en home/admin/Respaldos\e[0m"
                sleep 3
				echo
                else 
                    echo 
                    echo -e "\e[1;31mEl archivo indicado no existe\e[0m"
                    sleep 2
                    echo
                fi
			fi	                     
         ;;          
        0)
        #Volvemos al menu anterior
            ./menu-respaldos.sh
         ;;       
        #Si el usuario ingresa una opcion no admitida, mostramos mensaje de error  
        *) echo -e "\e[1;31mOpcion no valida, ingrese otra opcion\e[0m"
            sleep 2
         ;;
    esac
done