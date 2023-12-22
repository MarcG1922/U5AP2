#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Uso: $0 <directorio>"
    exit 1
fi

directorio=$1

if [ ! -d "$directorio" ]; then
    echo "El directorio $directorio no existe."
    exit 1
fi

archivos_borrados=0

for archivo in "$directorio"/*.txt; do
    if [ -e "$archivo" ]; then
        rm "$archivo"
        ((archivos_borrados++))
    fi
done

echo "Se han borrado $archivos_borrados archivos con extensión .txt en el directorio $directorio."
