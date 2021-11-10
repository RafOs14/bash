#!/bin/bash

#Funcion que muestra un menu por pantalla al usuario y guarda la opcion elegida en la variable opc
function _crearUsuario(){
    clear
    echo ""
    echo -e " \e[10m========= Ventana Usuarios ==========\e[0m"   
    echo -e "      \e[1;37m1 - Crear Usuario\e[0m"
	echo -e "      \e[1;37m2 - Eliminar usuario\e[0m"
    echo -e "      \e[1;37m3 - Bloquear usuario\e[0m"
    echo -e "      \e[1;37m4 - Desbloquear usuario\e[0m"
    echo -e "      \e[1;37m5 - Cambiar Contraseña\e[0m"
    echo -e "      \e[1;37m6 - Asignar usuario a grupo\e[0m"
    echo -e "      \e[1;32m0 - Volver\e[0m"  
    echo -e " \e[10m=====================================\e[0m"
    echo ""
    read -p  "Por favor seleccione una opcion: 
"  opc    
    return $opc
}
#Mientras la opcion sea distinta a 0 sigue mostrando el menu, llamamos a la funcion y ejecutamos la opcion
#indicada por el usuario
while [[ $opc != 0 ]] 
do
    _crearUsuario

    case $opc in 
        1)
			#Crea un usuario y le asigna todos los valores por defecto
            #Limpiamos la pantalla con clear			
			clear
			echo -e "\e[1;37mCrear Usuario\e[0m"
            #Pedimos el nombre al usuario y lo guardamos en la variable usuario
			read -p "Ingrese el nombre del usuario: " usuario
            #Agregamos el usuario con adduser y tomamos el nombre de la variable
			sudo adduser $usuario		
            echo -e "\e[1;37mIndique la contraseña del usuario\e[0m"
            #Indicamos la contraseña del usuario con passwd
            sudo passwd $usuario
		;;
		2)
			#Elimina el usuario indicado por quien ejecuta el script
            #Limpiamos la pantalla con clear
			clear
			echo -e "\e[1;37mEliminar Usuario\e[0m"
            #Pedimos el nombre al usuario y lo guardamos en la variable usuario
			read -p "Ingrese el nombre: " usuario
            #Borramos el usuario con userdel y todos los archivos del mismo con -r
			sudo userdel -r $usuario
         ;; 
        3)
            #Bloquea la cuenta de usuario modificando la contraseña
            #Limpiamos la pantalla con clear
            clear
            echo -e "\e[1;37mBloquear usuario\e[0m"
            #Pedimos el nombre del usuario a bloquear
            read -p "Indicar el usuario a bloquear: " usuario
            #Con esto agregamos un ! delante de la contraseña de usuario
            sudo passwd $usuario -l      
        ;;
        4)
            #Desbloquea la cuenta de usuario modificando la contraseña
            #Limpiamos la pantalla con clear
            clear
            echo -e "\e[1;37mDesbloquear usuario\e[0m"
            #Pedimos el nombre del usuario a desbloquear
            read -p "Indicar el usuario a bloquear: " usuario
            #Con esto desbloqueamos la cuenta de usuario
            sudo passwd $usuario -u
        ;;
        5)
            #Cambia la contraseña del usuario indicado			
			clear
			echo -e "\e[1;37Cambiar contraseña de Usuario\e[0m"
			read -p "Ingrese el nombre del usuario: " usuario
			sudo passwd $usuario
        ;;         
        6)  
            #Asignar grupo a un usuario
            #Limpiamos la pantalla con clear
            clear
            echo -e "\e[1;37Asignar grupo a Usuario\e[0m"
            #Pedimos el nombre y el grupo al usuario y lo guardamos en las variables
            read -p "Indique el nombre de usuario: " usuario            
            read -p "Indique el nombre del grupo: " grupo
            #Modificamos el grupo del usuario con usermod
            sudo usermod -a -G $grupo $usuario
        ;;
        0)
            #Volvemos al menu anterior
            ./menu-gestion.sh
         ;;         
        *) 
            #Si el usuario indica una opcion no contemplada por el script nos muestra lo siguiente
            echo -e "\e[1;31mOpcion no valida, ingrese otra opcion\e[0m"
            sleep 2
         ;;
    esac
done