# Busca archivos de más de 100 MB bajo la ruta indicada.
# El script solo lee información; no modifica ni elimina archivos.

$ruta = Read-Host 'Introduce la ruta de la carpeta que quieres analizar'

if (-not (Test-Path -Path $ruta -PathType Container)) {
    Write-Error "La carpeta no existe o la ruta no es válida: $ruta"
    exit 1
}

$limiteBytes = 100MB
$archivosGrandes = Get-ChildItem -Path $ruta -Recurse -File -ErrorAction SilentlyContinue |
    Where-Object { $_.Length -gt $limiteBytes } |
    Sort-Object -Property Length -Descending

if (-not $archivosGrandes) {
    Write-Host 'No se encontraron archivos de más de 100 MB.'
    exit 0
}

Write-Host 'Archivos encontrados, ordenados de mayor a menor:'
$archivosGrandes | ForEach-Object {
    [pscustomobject]@{
        Nombre = $_.Name
        Ruta   = $_.FullName
        TamanoMB = [math]::Round($_.Length / 1MB, 2)
    }
} | Format-Table -AutoSize
