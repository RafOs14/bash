#!/bin/bash

#Funcion que muestra las opciones al usuario y pide una opcion
function _empaquetar(){
	clear
    echo ""
    echo -e " \e[10m============ Ventana Empaquetar ============\e[0m"
    echo -e "      		\e[1;37m1 - Empaquetar\e[0m"
    echo -e "      		\e[1;32m0 - Volver\e[0m"  
    echo -e " \e[10m============================================\e[0m"
    echo ""
    read -p  "Por favor seleccione una opcion: 
"  opc    
    return $opc
}
#Mientras la opcion sea distinta de cero, mostramos el menu
while [[ $opc != 0 ]] 
do
    _empaquetar

    case $opc in 
        1)	
			#Limpiamos la pantalla con clear
			clear
			echo -e " \e[10m============ Empaquetar ============\e[0m"
    		echo -e "      \e[1;37m	   Empaquetar\e[0m"
			echo -e " \e[10m====================================\e[0m"
			#Pedimos al usuario que ingrese lo que quiere empaquetar (Archivo o directorio)
			read -p "Ingrese la ruta a empaquetar (ej: /home/admin): " ruta			
			#Con el comando tar empaquetamos el archivo indicado por el usuario
			#Evaluamos si el usuario ingreso informacion en ruta, si no tiene informacion valida mostramos
			#el mensaje de error
			if [ -z "$ruta" ]
			then	
				echo 
				echo -e "\e[1;31mLa ruta no puede estar vacia\e[0m"
				sleep 2
				echo
			else
			#Indicamos la ruta donde se debe generar el archivo de respaldo y le colocamos la fecha
			#Solicitamos con que nombre se debe guardar el archivo
				read -p "Ingrese el nombre del archivo (sin extension): " archivo		
				sudo tar cvfz /home/admin/Respaldos/$archivo"-"$(date +%d-%m-%Y)".tar" $ruta
				echo
				echo -e "\e[1;32mEmpaquetado realizado con exito en home/admin/Respaldos\e[0m"
				sleep 2
				echo				
			fi									
         ;;          
        0)
		#Volvemos al menu anterior
            ./menu-respaldos.sh
         ;;      
		#Si indica una opcion no permitida, mostramos mensaje de error   
        *) echo -e "\e[1;31mOpcion no valida, ingrese otra opcion\e[0m"
			sleep 2
         ;;
    esac
done