
Pasos a seguir para abrir el proyecto de examen Mercadito.

Descargue la imagen del manejador Microsoft SQL Server 2019
del siguiente enlace:  https://hub.docker.com/search?q=microsoft%20sql%20server%202019&image_filter=official

lo ejecute en la terminal de visual estudio code la siguiente linea de comando  docker pull mcr.microsoft.com/mssql/server:2019-CU18-ubuntu-20.04
esto me permite descargar la imagen del manejador sql server y se instala en mi docker desktop.

cree los siguintes archivos en mi carpeta de proyecto.
ARCHIVO DOCKER-COMPOSE.YML 
Se creo el archivo o documento ya que nos apoya a configurar los servicios de la aplicación. 
Para la configuracion solo nos exige 3 parametros las varianbles del entorno, el environment del path y el expose como puerto como lo pueden observar en el archivo.

ARCHIVO DOCKER FILE
Este documento nos ayuda para configurar las instrucciones necesarias para generar configuraciones del contenedor.

luego de tener estos archivos creados y configurados ejecute los soguientes comandos para levantar y crear el contenedor de sql server 2019

-docker compose up --build  para levantar crear y correr el servicio de sql server.

al tener esto listo  ingrese a mi sql server local o otro gestor de base de datos, lo configure con los parametros que se ingresaron en los
archivos docker compose.yml y docker file para crear la conexion en el contenedor de docker que son los siguintes:

localhost,20000  haciendo referencia al puerto.
password Jmpadilla97

al ingresasr se procedio a crear el script de la base de datos Mercadito.