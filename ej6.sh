#!/bin/bash

if [ ! -f "precipitaciones.txt" ]; then
    echo "El archivo precipitaciones.txt no existe."
    exit 1
fi

dias_semana=("lunes" "martes" "miércoles" "jueves" "viernes" "sábado" "domingo")

dias_sin_lluvia=()

while read -r linea; do
    dia=$(echo "$linea" | awk '{print $1}')

    indice=$(echo "${dias_semana[@]}" | grep -o "\b$dia\b" | wc -w)

    if [ -z "$indice" ]; then
        echo "Error: formato incorrecto en la línea: $linea"
    else
        if [ -z "$(echo "$linea" | awk '{print $2}')" ]; then
            dias_sin_lluvia+=("${dias_semana[$((indice - 1))]}")
        fi
    fi
done < precipitaciones.txt

echo "Días en los que no llovió:"
for dia in "${dias_sin_lluvia[@]}"; do
    echo "$dia"
done
