# Comprueba Spooler, W32Time y Dnscache e informa si alguno no existe.

$servicios = @('Spooler', 'W32Time', 'Dnscache')

foreach ($nombreServicio in $servicios) {
    try {
        $servicio = Get-Service -Name $nombreServicio -ErrorAction Stop
        Write-Host ("{0}: {1}" -f $servicio.Name, $servicio.Status)
    }
    catch {
        Write-Warning "El servicio '$nombreServicio' no existe o no se pudo consultar en este equipo."
    }
}
