#!/bin/bash
# 00 23 * * * /home/admin/ScriptsProyecto/backups.sh
#Pasos que realiza el script para cada caso
# Comprimimos y empaquetamos el archivo colocandole el dia de la fecha,
# tomando la misma del sistema con la sentencia $(date +%d-%m-%Y)
# en el orden día, mes, año

#chmod ugo+x /home/admin/ScriptsProyecto/backups.sh

#backup de etc 
tar cvfz /home/admin/Respaldos/backupetc" - "$(date +%d-%m-%Y) /etc

#backup de var
tar cvfz /home/admin/Respaldos/backupvar" - "$(date +%d-%m-%Y) /var

#backup de useradd 
tar cvfz /etc/default/backupuseradd" - "$(date +%d-%m-%Y) /etc/default/useradd

#back up de group 
tar cvfz /home/admin/Respaldos/backupgroup" - "$(date +%d-%m-%Y) /etc/group

#back up de crontab 
tar cvfz /home/admin/Respaldos/backupcrontab" - "$(date +%d-%m-%Y) /etc/crontab

#back up de shadow
tar cvfz /home/admin/Respaldos/backupshadow" - "$(date +%d-%m-%Y) /etc/shadow

#back up de gshadow 
tar cvfz /home/admin/Respaldos/backupgshadow" - "$(date +%d-%m-%Y) /etc/gshadow

#back up de passwd 
tar cvfz /home/admin/Respaldos/backuppasswd" - "$(date +%d-%m-%Y) /etc/passwd

#back up de login.defs
tar cvfz /home/admin/Respaldos/backuplogin.defs" - "$(date +%d-%m-%Y) /etc/login.defs

#Backup archivo con configuraciones de red
tar cvfz /home/admin/Respaldos/backup-ifcfg-enp0s3" - "$(date +%d-%m-%Y) /etc/sysconfig/network-scripts/ifcfg-enp0s3

#Backup de scripts de proyecto
tar cvfz /home/admin/Respaldos/backupScriptsProyecto" - "$(date +%d-%m-%Y) /home/admin/ScriptsProyecto

#back up de home
tar cvfz /home/admin/Respaldos/backuphome" - "$(date +%d-%m-%Y) /home

#back up de Logs
tar cvfz /home/admin/Respaldos/backuplogs" - "$(date +%d-%m-%Y) /home/admin/Logs

#Backup de la base de datos del proyecto
sudo mysqldump -u root -padmin  itisoftware > /home/admin/Respaldos/respaldoitisoftware.sql
sudo tar cvfz /home/admin/Respaldos/respaldobase" - "$(date +%d-%m-%Y) /home/admin/Respaldos/respaldoitisoftware.sql

################################ Respaldos con RSYNC ############################################

#backup de etc 
sudo rsync -av /etc /home/admin/Respaldos/backupetc" - "$(date +%d-%m-%Y)

#backup de var
sudo rsync -av /var /home/admin/Respaldos/backupvar" - "$(date +%d-%m-%Y)

#backup de useradd 
sudo rsync -av /etc/default/useradd /home/admin/Respaldos/backupuseradd" - "$(date +%d-%m-%Y)

#back up de group 
sudo rsync -av /etc/group /home/admin/Respaldos/backupgroup" - "$(date +%d-%m-%Y)

#back up de shadow 
sudo rsync -av /etc/shadow /home/admin/Respaldos/backupshadow" - "$(date +%d-%m-%Y)

#back up de gshadow 
sudo rsync -av /etc/gshadow /home/admin/Respaldos/backupgshadow" - "$(date +%d-%m-%Y)

#back up de passwd 
sudo rsync -av /etc/passwd /home/admin/Respaldos/backuppasswd" - "$(date +%d-%m-%Y)

#back up de login.defs
sudo rsync -av /etc/login.defs /home/admin/Respaldos/backuplogin.defs" - "$(date +%d-%m-%Y)

#Backup archivo con configuraciones de red
sudo rsync -av /etc/sysconfig/network-scrpts/ifcfg-enp0s3 /home/admin/Respaldos/backup-ifcfg-enp0s3" - "$(date +%d-%m-%Y)

#Backup de Home
sudo rsync -av /home/admin/ /home/admin/Respaldos/backuphome" - "$(date +%d-%m-%Y)

#Backup de scripts de proyecto
sudo rsync -av /home/admin/ScriptsProyecto /home/admin/Respaldos/backupScriptsProyecto" - "$(date +%d-%m-%Y)

#Backup de Logs
sudo rsync -av /home/admin/Logs /home/admin/Respaldos/backupLogs" - "$(date +%d-%m-%Y)

#Backup de la base de datos del proyecto
sudo mysqldump -u root -padmin  itisoftware > /home/admin/Respaldos/respaldoitisoftware.sql
sudo rsync -av /home/admin/Respaldos/respaldoitisoftware.sql /home/admin/Respaldos/respaldobase" - "$(date +%d-%m-%Y)

################################ Fin de Respaldos con Rsync ######################################