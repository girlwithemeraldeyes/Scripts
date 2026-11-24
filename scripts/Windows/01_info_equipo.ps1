# Muestra información básica del equipo y del sistema operativo.

$nombreEquipo = $env:COMPUTERNAME
$usuario = $env:USERNAME
$fechaHora = Get-Date
$sistemaOperativo = Get-CimInstance -ClassName Win32_OperatingSystem

Write-Host "Nombre del equipo: $nombreEquipo"
Write-Host "Usuario: $usuario"
Write-Host "Fecha y hora: $fechaHora"
Write-Host "Sistema operativo: $($sistemaOperativo.Caption)"
Write-Host "Versión: $($sistemaOperativo.Version)"
