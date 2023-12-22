#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Uso: $0 <numero_subdirectorios>"
    exit 1
fi

num_subdirectorios=$1

if ! [[ $num_subdirectorios =~ ^[1-9][0-9]*$ ]]; then
    echo "Por favor, introduzca un número entero positivo mayor que cero."
    exit 1
fi

while IFS= read -r nombre; do
    for ((i = 1; i <= num_subdirectorios; i++)); do
        mkdir -p "directorio_${i}/${nombre}"
    done
done < nombres.txt

echo "Estructura de directorios creada exitosamente."
