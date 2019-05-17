#!/bin/bash
#
# 
# Lenin Hernandez
# https://leninmhs.com.ve
# @leninmhs
#

IMAGENES=$HOME"/Imágenes/wallpapers"

if [ ! -d $IMAGENES ]; then
	echo "No existe el directorio: '$IMAGENES' de donde se tomaran los wallpapers\n"
	read -p "Desea crearlo? (Y)/N: " crearcarpeta
	
	if [ $crearcarpeta = "Y" ] || [ $crearcarpeta = "y"]; then
		mkdir -p $IMAGENES
		echo "Genial! Se creo el directorio '$IMAGENES' para tus wallpapers!!";
		
	else
		
		read -p "Desea crear el directorio en otra ruta? (Y)/N: " crearruta
		if [ $crearruta = "Y" ]; then
			read -p "Introduzca la ruta completa a utilizar para crear el directorio: " rutawallpaper
			echo "Se creo el directorio: $rutawallpaper para tus wallpapers"
			mkdir -p $rutawallpaper
		fi
		exit 1
	fi	
	

fi	

# ALEATORIO define si quiere que el wallpaper se seleccione aleatoriamente
# Los valores validos son: true or false 
ALEATORIO=true

#wget https://wallpapers.wallhaven.cc/wallpapers/full/wallhaven-1.jpg -P $IMAGENES

if $ALEATORIO ; then
IMAGEN=$(ls $IMAGENES/*$(.{png,jpg}) | shuf -n1)
else
echo "No es aleatorio"
#IMAGEN=$(ls -rt $IMAGENES/*.png *.jpg | tail -1)
IMAGEN=$(ls -rt $IMAGENES/*$(.{png,jpg}) | tail -1)
fi

echo $IMAGEN

gsettings set org.mate.background picture-filename $IMAGEN
gsettings set org.gnome.desktop.background picture-uri file:///$IMAGEN


