#!/bin/bash
# Benjamin Olguin Miranda
# Agregar servicio al arreglo y enjoy

# Probado en Ubuntu 16.04 Kernel 4.13.0
# sudo chmod +x servi.sh
# sudo ./servi.sh

servicios=('mysql' 'apache2' 'cups' 'mosquitto' 'ufw')

segundos=10

rojo="\e[1;31m"
verde="\e[1;32m"

echo -e "${rojo}########################################"
echo -e "${rojo}  Ejecutar Script con permisos de ROOT  \e[0m"
echo -e "${rojo}########################################\n"

n=`expr ${#servicios[*]} - 1`

while [ 1 -eq 1 ]
do
	for (( i=0; i<=$n; i++))
		do
			#if (( $(ps -ef | grep -v grep | grep ${servicios[$i]} | wc -l) > 0 ))
			if (( $(systemctl status ${servicios[$i]} | grep inactive | wc -l) == 0 ))
		   	then
		    	echo -e "${verde} ${servicios[$i]} esta funcionando!!! \e[0m"
		    	systemctl status ${servicios[$i]} | grep active
		   	else
		   		echo -e "${rojo} Reiniciando ${servicios[$i]} \e[0m"
		      	sudo systemctl start ${servicios[$i]}
		   	fi
		done
	sleep ${segundos}s
	echo -e "\n"
done