# Muestra la capacidad y el espacio libre de la unidad C:.
# Genera una advertencia cuando queda menos del 15 % libre.

$disco = Get-CimInstance -ClassName Win32_LogicalDisk -Filter "DeviceID='C:'"

if ($null -eq $disco -or $disco.Size -eq 0) {
    Write-Error 'No se pudo obtener información de la unidad C:.'
    exit 1
}

$espacioTotalGB = $disco.Size / 1GB
$espacioLibreGB = $disco.FreeSpace / 1GB
$porcentajeLibre = ($disco.FreeSpace / $disco.Size) * 100

Write-Host ("Capacidad total: {0:N2} GB" -f $espacioTotalGB)
Write-Host ("Espacio libre: {0:N2} GB" -f $espacioLibreGB)
Write-Host ("Espacio libre: {0:N1} %" -f $porcentajeLibre)

if ($porcentajeLibre -lt 15) {
    Write-Warning 'Queda menos del 15 % de espacio libre en la unidad C:.'
}
