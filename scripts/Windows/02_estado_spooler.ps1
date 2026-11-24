# Comprueba el estado del servicio de cola de impresión.
# Este script solo consulta el estado: no inicia ni detiene el servicio.

try {
    $servicio = Get-Service -Name 'Spooler' -ErrorAction Stop

    if ($servicio.Status -eq 'Running') {
        Write-Host "El servicio $($servicio.Name) está en ejecución."
    }
    else {
        Write-Warning "El servicio $($servicio.Name) está detenido."
    }
}
catch {
    Write-Error 'No se pudo consultar el servicio Spooler.'
}
