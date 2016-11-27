#!/usr/bin/env bash

# variables
fecha=$( date +%Y%m )


# pruebas
if [ ! -z $1 ]; then
    fecha=$1
fi

# exportar a PNG
inkscape carteles/$fecha-cartel.svg -w 640 -e carteles/${fecha}-cartel.png

# convertir a curvas
#!/bin/bash
orig=carteles/${fecha}-cartel.svg
curvas=carteles/${fecha}-cartel-curvas.svg
cp $orig $curvas
inkscape $curvas \
     --verb=UnlockAllInAllLayers \
     --verb=UnhideAllInAllLayers \
     --verb=EditSelectAllInAllLayers \
     --verb=ObjectToPath \
     --verb=FileSave \
     --verb=FileQuit

# copiar archivos principales
rm cartel-web.png cartel.svg
cp carteles/$fecha-cartel.svg cartel.svg
cp carteles/$fecha-cartel-curvas.svg cartel-curvas.svg
cp carteles/$fecha-cartel.png cartel-web.png
