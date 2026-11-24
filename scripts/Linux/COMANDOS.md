# Comandos de Linux

Estos son comandos para escribir en la terminal de Ubuntu. Los comandos con sudo pueden pedir la contraseña del usuario.

## Archivos y carpetas

Mostrar la ruta actual:
pwd

Listar archivos, incluidos los ocultos, con detalles:
ls -la

Crear una carpeta:
mkdir pruebas

Crear varios archivos vacíos:
touch archivo1.txt archivo2.txt archivo3.txt

Copiar un archivo:
cp archivo.txt copia.txt

Mover o renombrar un archivo:
mv archivo.txt carpeta/archivo.txt
mv nombre_anterior.txt nombre_nuevo.txt

Mostrar el contenido de un archivo:
cat archivo.txt

Buscar una palabra dentro de un archivo:
grep 'Hola' archivo.txt

Eliminar un archivo:
rm archivo.txt

Eliminar una carpeta vacía:
rmdir carpeta_vacia

Eliminar una carpeta y su contenido:
rm -r carpeta
Comprueba bien la ruta antes de usar rm -r.

## Recursos del sistema y procesos

Ver espacio libre y ocupado en los sistemas de archivos:
df -h

Ver memoria RAM:
free -h

Listar procesos:
ps -e

Buscar procesos por nombre:
pgrep systemd

Ver consumo de recursos en tiempo real:
top

## Servicios

Listar servicios activos:
sudo systemctl list-units --type=service --state=running

Consultar el estado:
systemctl status nombre-servicio

Iniciar, detener o reiniciar un servicio:
sudo systemctl start nombre-servicio
sudo systemctl stop nombre-servicio
sudo systemctl restart nombre-servicio

Consultar los últimos registros de un servicio:
sudo journalctl -u nombre-servicio -n 50

## Red y DNS

Mostrar interfaces y direcciones de red:
ip a

Probar conectividad con una máquina:
ping -c 4 DIRECCION_IP_O_NOMBRE
127.0.0.1 solo comprueba la propia máquina; para probar otra, usa su IP o nombre.

Consultar qué dirección IP resuelve un nombre:
dig google.com

## Usuarios y grupos

Crear un usuario:
sudo adduser lara

Crear un grupo:
sudo groupadd expediciones

Añadir un usuario a un grupo:
sudo usermod -aG expediciones lara

Consultar los grupos de un usuario:
groups lara

Cambiar temporalmente a otro usuario:
su - lara

## Permisos y propiedad

Ver permisos, propietario y grupo:
ls -l
ls -ld carpeta

Cambiar el propietario de un archivo:
sudo chown lara archivo.txt

Cambiar el grupo propietario:
sudo chgrp expediciones archivo.txt

Dar al propietario lectura y escritura, y lectura al grupo y al resto:
chmod 644 archivo.txt

Dar al propietario todos los permisos y al grupo lectura y acceso a una carpeta:
chmod 750 carpeta

Dar lectura, escritura y acceso al propietario y al grupo:
chmod 770 carpeta

Añadir permiso de ejecución al script:
chmod +x archivo.sh

Quitar permiso de escritura al grupo:
chmod g-w archivo.txt

Los permisos 777 dan lectura, escritura y ejecución a todo el mundo; evita usarlos salvo en una prueba aislada y entendiendo el riesgo. chmod 600, en cambio, deja lectura y escritura solo al propietario.

## Scripts Bash

Dale permiso de ejecución y ejecútalo desde la carpeta del script:
chmod +x nombre_script.sh
./nombre_script.sh

Los ejercicios automatizados de servicios están en la subcarpeta scripts.
