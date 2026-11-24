# Crea cinco carpetas de departamento dentro de una carpeta de pruebas.
# Si ya existen, no las vuelve a crear.

$carpetaPruebas = Join-Path -Path $PSScriptRoot -ChildPath 'Pruebas'

if (-not (Test-Path -Path $carpetaPruebas -PathType Container)) {
    New-Item -Path $carpetaPruebas -ItemType Directory | Out-Null
}

for ($i = 1; $i -le 5; $i++) {
    $rutaDepartamento = Join-Path -Path $carpetaPruebas -ChildPath "Departamento$i"

    if (-not (Test-Path -Path $rutaDepartamento -PathType Container)) {
        New-Item -Path $rutaDepartamento -ItemType Directory | Out-Null
        Write-Host "Creada la carpeta: $rutaDepartamento"
    }
    else {
        Write-Host "La carpeta ya existe: $rutaDepartamento"
    }
}
