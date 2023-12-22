#!/bin/bash

if [ ! -f "listado.txt" ]; then
    echo "El archivo listado.txt no existe."
    exit 1
fi

linux_users=0
windows_users=0
total_linux_processes=0
total_windows_processes=0

while IFS=' ' read -r usuario sistema procesos; do
    case $sistema in
        "Linux")
            ((linux_users++))
            ((total_linux_processes += procesos))
            ;;
        "Windows")
            ((windows_users++))
            ((total_windows_processes += procesos))
            ;;
        *)
            echo "Sistema desconocido: $sistema"
            ;;
    esac
done < listado.txt

echo "Usuarios de Linux: $linux_users"
echo "Total de procesos en Linux: $total_linux_processes"
echo "Usuarios de Windows: $windows_users"
echo "Total de procesos en Windows: $total_windows_processes"
