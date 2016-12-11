#!/usr/bin/env bash

# variables
fecha=$( date +%Y%m )


# pruebas
if [ ! -z $1 ]; then
    fecha=$1
fi


# convertir a curvas
orig=carteles/${fecha}-cartel.svg
curvas=carteles/${fecha}-cartel-curvas.svg

cp ${orig} ${curvas}

inkscape ${curvas} \
     --verb=UnlockAllInAllLayers \
     --verb=UnhideAllInAllLayers \
     --verb=EditSelectAllInAllLayers \
     --verb=ObjectToPath \
     --verb=FileSave \
     --verb=FileQuit


# exportar
## PNG web
inkscape carteles/${fecha}-cartel.svg \
    -w 640 \
    -e carteles/${fecha}-cartel-web.png

## PNG impresión
inkscape carteles/${fecha}-cartel.svg \
    -d 300 \
    -e impresion/${fecha}-cartel.png

## PDF impresión
inkscape carteles/${fecha}-cartel.svg \
    -d 300 \
    -A impresion/${fecha}-cartel.pdf

## curvas
cp ${curvas} impresion/${fecha}-cartel-curvas.svg

# copiar archivos principales
## limpieza
rm -f cartel.svg cartel-curvas.svg

## copiado
cp carteles/${fecha}-cartel.svg cartel.svg
cp carteles/${fecha}-cartel-curvas.svg cartel-curvas.svg
