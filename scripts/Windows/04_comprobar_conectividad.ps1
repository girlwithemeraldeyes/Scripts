# Pide una IP o un nombre de equipo y comprueba si responde a ping.

$destino = Read-Host 'Introduce una dirección IP o un nombre de equipo'

if ([string]::IsNullOrWhiteSpace($destino)) {
    Write-Warning 'No has introducido ningún destino.'
    exit 1
}

$responde = Test-Connection -ComputerName $destino -Count 2 -Quiet -ErrorAction SilentlyContinue

if ($responde) {
    Write-Host "El destino $destino responde."
}
else {
    Write-Warning "No se ha obtenido respuesta de $destino."
}
