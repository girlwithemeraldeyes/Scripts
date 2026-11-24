# Exporta nombre, PID y memoria de trabajo de los procesos a procesos.csv.
# El CSV se guarda junto al script y se reemplaza al volver a ejecutar el script.

$rutaCsv = Join-Path -Path $PSScriptRoot -ChildPath 'procesos.csv'

$procesos = Get-Process | Select-Object @{Name = 'Nombre'; Expression = { $_.ProcessName }}, @{Name = 'PID'; Expression = { $_.Id }}, @{Name = 'RAM_MB'; Expression = { [math]::Round($_.WorkingSet64 / 1MB, 2) }}

$procesos | Export-Csv -Path $rutaCsv -NoTypeInformation -Encoding UTF8

Write-Host "Informe creado en: $rutaCsv"
