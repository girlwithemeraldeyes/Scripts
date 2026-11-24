#!/usr/bin/env bash
# Comprueba un servicio indicado como argumento.
# Uso: ./03_comprobar_servicio_argumento.sh nombre-servicio

if [[ $# -lt 1 ]]; then
    echo "Uso: $0 nombre-servicio"
    exit 1
fi

servicio="$1"
load_state=$(systemctl show --property=LoadState --value "$servicio" 2>/dev/null)

if [[ -z "$load_state" || "$load_state" == "not-found" ]]; then
    echo "El servicio '$servicio' no existe."
    exit 1
fi

estado=$(systemctl show --property=ActiveState --value "$servicio" 2>/dev/null)

case "$estado" in
    active) echo "El servicio '$servicio' existe y está activo." ;;
    inactive) echo "El servicio '$servicio' existe, pero está inactivo." ;;
    failed) echo "El servicio '$servicio' existe, pero está en estado de fallo." ;;
    *) echo "El servicio '$servicio' existe. Estado: $estado." ;;
esac
