#!/usr/bin/env bash
# Lee nombres de servicios desde un archivo y muestra existencia y estado.
# Puedes indicar otra ruta como primer argumento.

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
archivo="$1"

if [[ -z "$archivo" ]]; then
    archivo="$SCRIPT_DIR/../datos/servicios.txt"
fi

if [[ ! -f "$archivo" ]]; then
    echo "No se encuentra el archivo: $archivo"
    exit 1
fi

while IFS= read -r servicio || [[ -n "$servicio" ]]; do
    [[ -z "$servicio" || "$servicio" == \#* ]] && continue

    load_state=$(systemctl show --property=LoadState --value "$servicio" 2>/dev/null)

    if [[ -z "$load_state" || "$load_state" == "not-found" ]]; then
        echo "$servicio - no existe"
        continue
    fi

    estado=$(systemctl show --property=ActiveState --value "$servicio" 2>/dev/null)
    echo "$servicio - $estado"
done < "$archivo"
