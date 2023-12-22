#!/bin/bash

if [ ! -f "precipitaciones.txt" ]; then
    echo "El archivo precipitaciones.txt no existe."
    exit 1
fi

total_litros=0
dias=0

while read -r linea; do
    litros=$(echo "$linea" | awk '{print $2}')

    if [[ "$litros" =~ ^[0-9]+(\.[0-9]+)?$ ]]; then
        total_litros=$(echo "$total_litros + $litros" | bc)
        ((dias++))
    else
        echo "Error: formato incorrecto en la línea: $linea"
    fi
done < precipitaciones.txt

if [ "$dias" -gt 0 ]; then
    media=$(echo "scale=2; $total_litros / $dias" | bc)
    echo "La media de precipitaciones es: $media litros por día"
else
    echo "No se encontraron datos válidos en el archivo."
fi
