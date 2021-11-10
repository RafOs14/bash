#!/bin/bash

#function logusuario(){
#    clear
#    read -p "Ingrese el usuario que desea visualizar: " user
#    
#    if [ -z "$user" ]
#    then
#        echo ""
#        echo -e "\e[1;31mNo existe ningun log para el usuario indicado, reintente.\e[0m"
#        sleep 2
#    else
#        echo ""
#        sudo cat /var/log/secure | grep "user "$user | more
#    fi
#        echo
#        read -p "Presione enter para continuar"
#}

#function logusuario(){

#    clear
#    echo -e " \e[10m======== Logs por fechas =========\e[0m"
#    echo -e "       \e[1;37m1 - Usuarios conectados\e[0m"  
#    echo -e "       \e[1;37m2 - Conexiones al sistema\e[0m"  
#    echo -e "       \e[1;37m3 - Ultima conexion\e[0m"
#    echo -e "       \e[1;37m4 - Conexiones fallidas\e[0m"
#    echo -e "       \e[1;32m0 - Volver\e[0m"
#    echo -e " \e[10m==================================\e[0m"
#    echo ""
#    read -p "Indique una opcion: " dato

#    while [[ $dato != 0 ]] 
#    do
#        case $dato in 
#        1)
#            clear
#            read -p "Ingrese el usuario que desea visualizar: " user
#            if [ -z "$user" ]
#            then
#                echo ""
#                echo -e "\e[1;31mNo existe ningun log para el usuario indicado, reintente.\e[0m"
#                sleep 2
#            else
#                echo ""
#                sudo utmpdump /var/run/utmp | grep "user "$user | more
#                echo ""
#                read -p "Presione enter para continuar"
#            fi
#            _menuLogs
#        ;;          
#        2)
#            clear
#            read -p "Ingrese el usuario que desea visualizar: " user
# 
#            if [ -z "$user" ]
#            then
#                echo ""
#                echo -e "\e[1;31mNo existe ningun log para el usuario indicado, reintente.\e[0m"
#                sleep 2
#            else
#                echo ""
#                sudo utmpdump /var/log/wtmp | grep "user "$user | more
#                echo ""
#                read -p "Presione enter para continuar"
#            fi
#            _menuLogs            
#        ;; 
#        3)
#            clear
#            read -p "Ingrese el usuario que desea visualizar: " user
# 
#            if [ -z "$user" ]
#            then
#                echo ""
#                echo -e "\e[1;31mNo existe ningun log para el usuario indicado, reintente.\e[0m"
#                sleep 2
#            else
#                echo ""
#                sudo utmpdump /var/log/lastlog | grep "user "$user | more
#                echo ""
#                read -p "Presione enter para continuar"
#            fi
#            _menuLogs 
#        ;;                
#        4)
#           clear
#            read -p "Ingrese el usuario que desea visualizar: " user
# 
#           if [ -z "$user" ]
#           then
#                echo ""
#                echo -e "\e[1;31mNo existe ningun log para el usuario indicado, reintente.\e[0m"
#                sleep 2
#            else
#                echo ""
#                sudo utmpdump /var/log/btmp | grep "user "$user | more
#                echo ""
#                read -p "Presione enter para continuar"
#            fi
#            _menuLogs
#        ;;
#        0)
            _menuLogs
#        ;;        
#        *) echo -e "\e[1;31mOpcion no valida, ingrese otra opcion\e[0m"
           sleep 2
#        ;;
#        esac
#    done
#}

#function logfecha(){
    
#    clear
#    echo -e " \e[10m======== Logs por fechas =========\e[0m"
#    echo -e "       \e[1;37m1 - Log por hora\e[0m"  
#    echo -e "       \e[1;37m2 - Log por dia\e[0m"  
#    echo -e "       \e[1;37m3 - Log por mes\e[0m"
#    echo -e "       \e[1;37m4 - Log por fecha completa\e[0m"
#    echo -e "       \e[1;32m0 - Volver\e[0m"
#    echo -e " \e[10m==================================\e[0m"
#    echo ""
#    read -p "Indique una opcion: " dato   
    
#    while [[ $dato != 0 ]] 
#    do
#        case $dato in 
#        1)
#            clear
#            echo "Ingrese una hora para visualizar, ejemplo: 00:00 - 23:59"
#            read -p "Indique la hora: " hora
#            vld=$(sudo cat /var/log/secure | grep $hora)
#            if [ -z "$vld" ]
#            then
#                echo ""
#                echo -e "\e[1;31mNo existen logs para la hora indicada.\e[0m"
#                sleep 2
#            else
#                echo ""
#                sudo cat /var/log/secure | grep -n $hora | more
#                echo ""
#                read -p "Presione enter para continuar"
#            fi
#            logfecha
#        ;;          
#        2)
#            clear
#            echo "Ingrese un dia para visualizar, ejemplo: 1,2,3... 31"
#            read -p "Indique el dia: " dia
#            vld=$(sudo cat /var/log/secure | grep $dia)
#            if [ -z "$vld" ]
#            then
#                echo ""
#                echo -e "\e[1;31mNo existen logs para el dia indicado.\e[0m"
#                sleep 2
#            else
#                echo ""
#                sudo cat /var/log/secure | grep -n $dia | more
#                echo ""
#                read -p "Presione enter para continuar"
#            fi 
#            logfecha            
#        ;; 
#        3)
#            clear
#            echo "Ingrese un mes para visualizar, ejemplo: Jan, Feb, Mar, Apr May, Jun, Jul, Ago, Sep, Oct, Nov, Dic"
#            read -p "Indique el mes: " mes
#            vld=$(sudo cat /var/log/secure | grep $mes)
#            if [ -z "$vld" ]
#            then
#                echo ""
#                echo -e "\e[1;31mNo existen logs para el mes indicado.\e[0m"
#                sleep 2
#            else
#                echo ""
#                sudo cat /var/log/secure | grep -n $mes | more
#                echo ""
#                read -p "Presione enter para continuar"
#            fi
#            logfecha
#        ;;                
#        4)
#           clear
#            echo "Ingrese un mes para visualizar, ejemplo: Jan, Feb, Mar, Apr May, Jun, Jul, Ago, Sep, Oct, Nov, Dic"
#            echo "Ingrese un dia para visualizar, ejemplo: 1,2,3... 31"
#            echo "Ingrese una hora para visualizar, ejemplo: 00:00 - 23:59"
#            read -p "Indique el mes: " mes
#            read -p "Indique el dia: " dia
#            read -p "Indique la hora: " hora
#            vld=$(sudo cat /var/log/secure | grep $mes | grep $dia | grep $hora)
#            if [ -z "$vld" ]
#            then
#                echo ""
#               echo -e "\e[1;31mNo existen logs para el periodo indicado.\e[0m"
#                sleep 2
#            else
#                echo ""
#                sudo cat /var/log/secure | grep -n $mes | grep $dia | grep $hora | more
#                echo ""
#                read -p "Presione enter para continuar"
#            fi 
#            logfecha
#        ;;
#        0)
#            _menuLogs
#        ;;        
#        *) echo -e "\e[1;31mOpcion no valida, ingrese otra opcion\e[0m"
#           sleep 2
#        ;;
#        esac
#    done   
#}

#function logMariadb(){
#    clear
#    sudo cat /var/log/mariadb/mariadb.log | grep "ERROR" | more
#    echo ""
#    read -p "Presione enter para continuar"
#}

#function logApache(){
#   clear
#    echo "Ingrese un filtro para visualizar, ejemplo: notice, warn"
#    read -p "Indique el filtro: " filtro
#    if [ -z "$filtro" ]
#        then
#            echo ""
#            echo -e "\e[1;31mNo existen logs para el filtro indicado.\e[0m"
#            sleep 2
#        else
#            echo ""
#            sudo cat /var/log/httpd/error_log | grep $filtro | more
#            echo ""
#            read -p "Presione enter para continuar"
#        fi    
#}

#function logSistema(){
#    clear
#    echo "Ingrese un mes para visualizar, ejemplo: Jan, Feb, Mar, Apr May, Jun, Jul, Ago, Sep, Oct, Nov, Dic"
#    read -p "Indique el mes: " mes
#    vld=$(sudo cat /var/log/messages | grep $mes)
#        if [ -z "$vld" ]
#        then
#            echo ""
#            echo -e "\e[1;31mNo existen logs para el mes indicado.\e[0m"
#            sleep 2
#        else
#            echo ""
#            sudo cat /var/log/messages | grep "kernel" | grep $mes | more
#            echo ""
#            read -p "Presione enter para continuar"
#        fi   
#}

#function todos(){
#    clear
#    sudo cat /var/log/secure
#   echo ""
#   read -p "Presione enter para continuar"
#    logfechas
#}
