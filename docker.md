# Instrucciones Docker para hello-python

## Construcción de la imagen

Para construir la imagen Docker, ejecuta el siguiente comando en el directorio del proyecto:

```bash
docker build -t beshmo/hello-python:1.0 .
```

## Ejecución del contenedor

Para ejecutar el contenedor y acceder a la aplicación:

```bash
docker run -p 5000:5000 beshmo/hello-python:1.0
```

La aplicación estará disponible en: `http://localhost:5000/`

## Ejecución en segundo plano

Para ejecutar el contenedor en modo detached (segundo plano):

```bash
docker run -d -p 5000:5000 --name hello-python-app beshmo/hello-python:1.0
```

## Detener el contenedor

```bash
docker stop hello-python-app
```

## Eliminar el contenedor

```bash
docker rm hello-python-app
```

## Eliminar la imagen

```bash
docker rmi beshmo/hello-python:1.0
```

## Subir la imagen al repositorio

Para subir la imagen a tu repositorio privado:

```bash
docker push beshmo/hello-python:1.0
```
