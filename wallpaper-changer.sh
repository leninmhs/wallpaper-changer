#!/bin/bash

IMAGENES="/home/leninmhs/Imágenes/wallpapers"

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


