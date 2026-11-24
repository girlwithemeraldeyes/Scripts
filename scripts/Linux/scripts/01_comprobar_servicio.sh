#!/usr/bin/env bash
# Pide el nombre de un servicio y muestra si existe y cuál es su estado.

read -r -p "Nombre del servicio (por ejemplo cron): " servicio

if [[ -z "$servicio" ]]; then
    echo "No has escrito el nombre de un servicio."
    exit 1
fi

load_state=$(systemctl show --property=LoadState --value "$servicio" 2>/dev/null)

if [[ -z "$load_state" || "$load_state" == "not-found" ]]; then
    echo "El servicio '$servicio' no existe."
    exit 1
fi

estado=$(systemctl show --property=ActiveState --value "$servicio" 2>/dev/null)

case "$estado" in
    active) echo "El servicio '$servicio' está activo." ;;
    inactive) echo "El servicio '$servicio' está inactivo." ;;
    failed) echo "El servicio '$servicio' está en estado de fallo." ;;
    *) echo "El servicio '$servicio' existe. Estado: $estado." ;;
esac
