#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Uso: $0 <rango_de_ip>"
    exit 1
fi

rango_ip=$1

for ip in $(seq 1 254); do
    direccion_ip="$rango_ip.$ip"
    resultado=$(ping -c 1 -W 1 $direccion_ip 2>/dev/null | grep "1 received")

    if [ ! -z "$resultado" ]; then
        echo "Dirección IP conectada: $direccion_ip"
    fi
done
