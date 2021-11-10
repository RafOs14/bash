#!/bin/bash
#script que nos permite realizar respaldo y restauracion de nuestras bases de datos, ingresamos a un menu,
#el cual nos brinda dos opciones

function _respaldobbdd(){
    clear
    echo ""
    echo -e " \e[10m=========== Respaldo de base de datos ============\e[0m"
    echo -e "       \e[1;37m1 - Respaldo de base de datos\e[0m"
    echo -e "       \e[1;37m2 - Restaurar base de datos\e[0m"  
    echo -e "       \e[1;32m0 - Volver al menu anterior\e[0m" 
    echo -e " \e[10m==================================================\e[0m"
    echo ""
    read -p  "Por favor seleccione una opcion: 
"  opc    
    return $opc
}

while [[ $opc != 0 ]] 
do
    _respaldobbdd

    case $opc in 
        1)
            #Solicitamos al usuario dos parametros la base a respaldar y el nombre del archivo en el que se guarda
            read -p "Indique la base de datos a respaldar: " base
            read -p "Nombre del archivo sql en el que desea guardar la información: " archivo
            #Validamos que la base exista en el directorio /var/lib/mysql
            if [ -d /var/lib/mysql/$base ]
            then
            #Si existe, realizamos el dump de la base y creamos el respaldo en el directorio de respaldos
                mysqldump -u root -padmin $base > /home/admin/Respaldos/$archivo".sql"            
            else
            #si no existe, mostramos mensaje de error
                echo -e "\e[1;31mLa base indicada para respaldar no existe, ingrese nueva base.\e[0m"
                sleep 2
            fi;                
         ;;          
        2)
        #Solicitamos al usuario la base a restaurar
            read -p "Indique la base de datos a recuperar: " base
        #Validamos que la base exista en el directorio de respaldos
            if [ -d /home/admin/Respaldos/$base];
            then
        #Si existe, restauramos la base desde el archivo de respaldo
                mysql -u root -padmin $base < /home/admin/Respaldos/$base".sql"              
            else
        #Si no, indicamos al usuario el error
                echo -e "\e[1;31mLa base indicada para recuperar no existe, ingrese nueva base.\e[0m"
                sleep 2                
            fi;            
         ;; 
        0)
        #Con esta opcion volvemos al menu principal
            /menu-respaldos.sh
         ;;               
        *) 
        #Si el usuario no ingresa una opcion valida, mostramos mensaje de error
            echo -e "\e[1;31mOpcion no valida, ingrese otra opcion\e[0m"
            sleep 2
         ;;
    esac
done
