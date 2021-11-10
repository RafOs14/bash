#!/bin/bash

#Funcion que muestra un menu al usuario con las opciones de gestion
function _crearGrupo(){
    clear
    echo ""
    echo -e " \e[10m========= Ventana Grupos ===========\e[0m"
    echo -e "      \e[1;37m1 - Crear Grupo\e[0m"
	echo -e "      \e[1;37m2 - Eliminar Grupo\e[0m"
	echo -e "      \e[1;37m3 - Asignar usuario al Grupo\e[0m"
    echo -e "      \e[1;37m4 - Quitar usuario del Grupo\e[0m"
    echo -e "      \e[1;32m0 - Volver\e[0m"  
    echo -e " \e[10m====================================\e[0m"
    echo ""
    read -p  "Por favor seleccione una opcion: 
"  opc    
    return $opc
}

#Mientras la opcion digitada por el usuario no sea 0 el menu se va a seguir mostrando con la llamada
#a la funcion _crearGrupo
while [[ $opc != 0 ]] 
do
    _crearGrupo

    case $opc in 
        1)
			#Crea un grupo y le asigna todos los valores por defecto			
			clear
			echo -e "\e[1;37m Crear Grupo\e[0m"
			read -p "Ingrese el nombre del grupo a crear: " grupo
			#if grep -iq "^$grupo:" /etc/group
			#then
			#	echo "Un grupo con este nombre ya existe en el sistema"			
			#else
				sudo groupadd $grupo
         ;; 
		2)
			#Elimina un grupo indicado por el usuario
            #Limpiamos la pantalla con clear			
			clear            
			echo -e "\e[1;37m Eliminar Grupo\e[0m"
            #Pedimos el nombre del grupo a borrar y lo guardamos en la variable grupo
			read -p "Ingrese el nombre del grupo a eliminar: " grupo
            #Borramos el grupo indicado con groupdel
			sudo groupdel $grupo						                          
         ;; 
		3)
			#Asignar usuarios a un grupo		
            #Limpiamos la pantalla con clear	
			clear
			echo -e "\e[1;37m Asignar usuarios al grupo\e[0m"
            #Pedimos el nombre de usuario y lo guardamos en la variable usuario
			read -p "Ingrese el nombre del usuario a asignar: " usuario
            #Pedimos el nombre del grupo y lo guardamos en la variable grupo
            read -p "Ingrese el nombre del grupo: " grupo
			sudo gpasswd -a $usuario $grupo			                          
         ;;  
         4)
			#Quitar usuarios de un grupo		
            #Limpiamos la pantalla con clear	
			clear
			echo -e "\e[1;37m Quitar usuarios del grupo\e[0m"
            #Pedimos el nombre de usuario y lo guardamos en la variable usuario
			read -p "Ingrese el nombre del usuario a quitar: " usuario
            #Pedimos el nombre del grupo y lo guardamos en la variable grupo
            read -p "Ingrese el nombre del grupo: " grupo
			sudo gpasswd -d $usuario $grupo			                          
         ;;          
        0)
        #Volvemos al menu anterior
            ./menu-gestion.sh
         ;; 
        #si la opcion no es valida mostramos mensaje de error        
        *) echo -e "\e[1;31mOpcion no valida, ingrese otra opcion\e[0m"
            sleep 2
         ;;
    esac
done