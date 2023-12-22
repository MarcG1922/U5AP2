#!/bin/bash

if [ ! -f "numeros.txt" ]; then
    echo "El archivo numeros.txt no existe."
    exit 1
fi

pares=0
impares=0

echo "Números Pares:"
while read -r numero; do
    if (( numero % 2 == 0 )); then
        echo $numero
        ((pares++))
    fi
done < numeros.txt

echo "Números Impares:"
while read -r numero; do
    if (( numero % 2 != 0 )); then
        echo $numero
        ((impares++))
    fi
done < numeros.txt

echo "Total de Números Pares: $pares"
echo "Total de Números Impares: $impares"
