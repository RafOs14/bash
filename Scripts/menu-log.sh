#!/bin/bash

#funcion que nos muestra un menu y dentro de cada opcion un script para visualizar
#los logs de usuarios
function logusuario(){

    clear
    echo -e " \e[10m========= Log de Usuarios ==========\e[0m"
    echo -e "       \e[1;37m1 - Usuarios conectados\e[0m"  
    echo -e "       \e[1;37m2 - Conexiones al sistema\e[0m"  
    echo -e "       \e[1;37m3 - Ultima conexion\e[0m"
    echo -e "       \e[1;37m4 - Conexiones fallidas\e[0m"
    echo -e "       \e[1;32m0 - Volver\e[0m"
    echo -e " \e[10m=====================================\e[0m"
    echo ""
    read -p "Indique una opcion: " dato

    while [[ $dato != 0 ]] 
    do
        case $dato in 
        1)
        #limpiamos la pantalla con clear y pedimos un usuario
            clear
            read -p "Ingrese el usuario que desea visualizar: " user 
        #validamos que el usuario exista
            if [ -z "$user" ]
            then
        #si no existe mostramos mensaje de error
                echo ""
                echo -e "\e[1;31mNo existe ningun log para el usuario indicado, reintente.\e[0m"
                sleep 2
            else
        #si existe realizamos un volcado del archivo utmp y mostramos los usuarios conectados
                echo ""
                sudo utmpdump /var/run/utmp | grep $user 
                echo ""
                read -p "Presione enter para continuar"
            fi
        #volvemos al menu
            logusuario
        ;;          
        2)
        #limpiamos la pantalla con clear y pedimos un usuario
            clear
            read -p "Ingrese el usuario que desea visualizar: " user 
        #validamos que el usuario exista
            if [ -z "$user" ]
            then
        #si no existe mostramos mensaje de error
                echo ""
                echo -e "\e[1;31mNo existe ningun log para el usuario indicado, reintente.\e[0m"
                sleep 2
            else
        #si existe realizamos un volcado del archivo wtmp y enviamos las conexiones del usuario a un archivo de texto
                echo ""
                sudo utmpdump /var/log/wtmp | grep $user >> /home/admin/Logs/logconexionesusuario
                echo ""
                read -p "Presione enter para continuar"
            fi
            logusuario            
        ;; 
        3)
        #limpiamos la pantalla con clear y pedimos un usuario
            clear
            read -p "Ingrese el usuario que desea visualizar: " user 
        #validamos que el usuario exista
            if [ -z "$user" ]
            then
        #si no existe mostramos mensaje de error
                echo ""
                echo -e "\e[1;31mNo existe ningun log para el usuario indicado, reintente.\e[0m"
                sleep 2
            else
        #si existe realizamos un volcado del archivo lastlog y mostramos la ultima conexion del usuario 
                echo ""
                sudo utmpdump /var/log/lastlog | grep $user | more
                echo ""
                read -p "Presione enter para continuar"
            fi
         #volvemos al menu
            logusuario 
        ;;                
        4)
        #limpiamos la pantalla con clear y pedimos un usuario
           clear
            read -p "Ingrese el usuario que desea visualizar: " user 
        #validamos que el usuario exista
            if [ -z "$user" ]
            then
        #si no existe mostramos mensaje de error
                echo ""
                echo -e "\e[1;31mNo existe ningun log para el usuario indicado, reintente.\e[0m"
                sleep 2
            else
        #si existe realizamos un volcado del archivo btmp y enviamos a un archivo la informacion de accesos fallidos de un usuario
                echo ""
                sudo utmpdump /var/log/btmp | grep $user >> /home/admin/Logs/logerrorconexion
                echo ""
                read -p "Presione enter para continuar"
            fi
         #volvemos al menu
            logusuario
        ;;
        0)
        #con esta opcion volvemos al menu de auditoria
            _menuLogs
        ;;        
        *) echo -e "\e[1;31mOpcion no valida, ingrese otra opcion\e[0m"
           sleep 2
        ;;
        esac
    done
}

#Funcion que nos permite visualizar un menu con opciones a la informacion del archivo secure
#el cual nos brinda informacion de seguridad
function logfecha(){
    
    clear
    echo -e " \e[10m======== Logs por fechas =========\e[0m"
    echo -e "       \e[1;37m1 - Log por hora\e[0m"  
    echo -e "       \e[1;37m2 - Log por dia\e[0m"  
    echo -e "       \e[1;37m3 - Log por mes\e[0m"
    echo -e "       \e[1;37m4 - Log por fecha completa\e[0m"
    echo -e "       \e[1;32m0 - Volver\e[0m"
    echo -e " \e[10m==================================\e[0m"
    echo ""
    read -p "Indique una opcion: " dato   
    
    while [[ $dato != 0 ]] 
    do
        case $dato in 
        1)
        #limpiamos la pantalla y pedimos una hora
            clear
            echo "Ingrese una hora para visualizar, ejemplo: 00:00 - 23:59"
            read -p "Indique la hora: " hora
        #creamos una variable y guardamos el comando adentro para validar si la hora
        #indicada por el usuario existe en el archivo
            vld=$(sudo cat /var/log/secure | grep $hora)
            if [ -z "$vld" ]
            then
        #si no existe mostramos el error
                echo ""
                echo -e "\e[1;31mNo existen logs para la hora indicada.\e[0m"
                sleep 2
            else
        #si existe, enviamos la informacion a un archivo de texto
                echo ""
                sudo cat /var/log/secure | grep -n $hora >> /home/admin/Logs/logxhora
                echo ""
                read -p "Presione enter para continuar"
            fi
        #volvemos al menu
            logfecha
        ;;          
        2)
        #limpiamos la pantalla y pedimos una hora
            clear
            echo "Ingrese un dia para visualizar, ejemplo: 1,2,3... 31"
            read -p "Indique el dia: " dia
        #creamos una variable y guardamos el comando adentro para validar si el dia
        #indicado por el usuario existe en el archivo
            vld=$(sudo cat /var/log/secure | grep $dia)
            if [ -z "$vld" ]
            then
        #si no existe mostramos el error
                echo ""
                echo -e "\e[1;31mNo existen logs para el dia indicado.\e[0m"
                sleep 2
            else
        #si existe, enviamos la informacion a un archivo de texto
                echo ""
                sudo cat /var/log/secure | grep -n $dia >> /home/admin/Logs/logxdia
                echo ""
                read -p "Presione enter para continuar"
            fi 
        #volvemos al menu
            logfecha            
        ;; 
        3)
        #limpiamos la pantalla y pedimos una hora
            clear
            echo "Ingrese un mes para visualizar, ejemplo: Jan, Feb, Mar, Apr May, Jun, Jul, Ago, Sep, Oct, Nov, Dic"
            read -p "Indique el mes: " mes
        #creamos una variable y guardamos el comando adentro para validar si el mes
        #indicado por el usuario existe en el archivo
            vld=$(sudo cat /var/log/secure | grep $mes)
            if [ -z "$vld" ]
            then
        #si no existe mostramos el error
                echo ""
                echo -e "\e[1;31mNo existen logs para el mes indicado.\e[0m"
                sleep 2
            else
        #si existe, enviamos la informacion a un archivo de texto
                echo ""
                sudo cat /var/log/secure | grep -n $mes >> /home/admin/Logs/logxmes
                echo ""
                read -p "Presione enter para continuar"
            fi
        #volvemos al menu
            logfecha
        ;;                
        4)
        #limpiamos la pantalla y pedimos una hora
           clear
            echo "Ingrese un mes para visualizar, ejemplo: Jan, Feb, Mar, Apr May, Jun, Jul, Ago, Sep, Oct, Nov, Dic"
            echo "Ingrese un dia para visualizar, ejemplo: 1,2,3... 31"
            echo "Ingrese una hora para visualizar, ejemplo: 00:00 - 23:59"
            read -p "Indique el mes: " mes
            read -p "Indique el dia: " dia
            read -p "Indique la hora: " hora
        #creamos una variable y guardamos los comando adentro para validar si los datos
        #indicados por el usuario existen en el archivo
            vld=$(sudo cat /var/log/secure | grep $mes | grep $dia | grep $hora)
            if [ -z "$vld" ]
            then
            #si no existen mostramos el error
                echo ""
                echo -e "\e[1;31mNo existen logs para el periodo indicado.\e[0m"
                sleep 2
            else
        #si existe, enviamos la informacion a un archivo de texto
                echo ""
                sudo cat /var/log/secure | grep -n $mes | grep $dia | grep $hora >> /home/admin/Logs/logfecha
                echo ""
                read -p "Presione enter para continuar"
            fi 
        #volvemos al menu
            logfecha
        ;;
        0)
        #volvemos al menu principal
            _menuLogs
        ;;        
        *) echo -e "\e[1;31mOpcion no valida, ingrese otra opcion\e[0m"
           sleep 2
        ;;
        esac
    done    
}

#funcion que nos permite visualizar los errores del servicio MariaDB
function logMariadb(){
    #Limpiamos la pantalla con clear, y ejecutamos el comando que envia la
    #informacion a un archivo de texto
    clear
    sudo cat /var/log/mariadb/mariadb.log | grep "ERROR" >> /home/admin/Logs/logMariaDB
    echo ""
    read -p "Presione enter para continuar"
}

#funcion que nos permite visualizar los errores del servicio Apache
function logApache(){
    #Limpiamos la pantalla con clear y pedimos un filtro de error al usuario
    clear
    echo "Ingrese un filtro para visualizar, ejemplo: notice, warn"
    read -p "Indique el filtro: " filtro
    if [ -z "$filtro" ]
    #si no existe el filtro, mostramos el error
        then
            echo ""
            echo -e "\e[1;31mNo existen logs para el filtro indicado.\e[0m"
            sleep 2
        else
    #si existe, mandamos la informacion a un archivo de texto
            echo ""
            sudo cat /var/log/httpd/error_log | grep $filtro >> /home/admin/Logs/logApache
            echo ""
            read -p "Presione enter para continuar"
        fi    
}

#funcion que nos permite visualizar los mensajes de error del sistema
function logSistema(){
    #limpiamos la pantalla con clear y pedimos un mes a visualizar
    clear
    echo "Ingrese un mes para visualizar, ejemplo: Jan, Feb, Mar, Apr May, Jun, Jul, Ago, Sep, Oct, Nov, Dic"
    read -p "Indique el mes: " mes
    #guaramos el comando en una variable para validar
    vld=$(sudo cat /var/log/messages | grep $mes)
        if [ -z "$vld" ]
        then
    #si el mes no existe, mostramos mensaje de error
            echo ""
            echo -e "\e[1;31mNo existen logs para el mes indicado.\e[0m"
            sleep 2
        else
    #si existe informacion para el mes indicado, mandamos la informacion a un archivo de texto
            echo ""
            sudo cat /var/log/messages | grep $mes >> /home/admin/Logs/logsistema
            echo ""
            read -p "Presione enter para continuar"
        fi   
}

#funcion que envia a un archivo de texto la informacion del archivo secure
function todos(){
    clear
    sudo cat /var/log/secure >> /home/admin/Logs/logssecure
    echo ""
    read -p "Presione enter para continuar"
}

#funcion que muuestra un menu central desde donde iremos a las distintas opciones 
function _menuLogs(){
    clear
    echo ""
    echo -e " \e[10m============== Ventana de Auditoria ==============\e[0m"
    echo -e "           \e[1;37m1 - Log de usuario\e[0m"  
    echo -e "           \e[1;37m2 - Log Por fecha\e[0m"  
    echo -e "           \e[1;37m3 - Log Servicio MariaDB\e[0m"
    echo -e "           \e[1;37m4 - Log Servicio Apache\e[0m"
    echo -e "           \e[1;37m5 - Log del sistema\e[0m"
    echo -e "           \e[1;37m6 - Logs de seguridad\e[0m"
    echo -e "           \e[1;32m0 - Menu Principal\e[0m"
    echo -e " \e[10m==================================================\e[0m"
    echo ""
    read -p  "Por favor seleccione una opcion: 
"  opc    
    return $opc
}

while [[ $opc != 0 ]] 
do
    _menuLogs

    case $opc in 
        1)
            logusuario
         ;;          
        2)
            logfecha
         ;; 
        3)
            logMariadb
         ;;  
        4)
            logApache
        ;;  
        5)
            logSistema  
        ;; 
        6)
            todos 
        ;;          
        0)
            ./menu-principal.sh
         ;;        
        *) 
            echo -e "\e[1;31mOpcion no valida, ingrese otra opcion\e[0m"
            sleep 2
         ;;
    esac
done