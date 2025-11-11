# Instrucciones Kubernetes para hello-python

## Aplicar el manifiesto

Para desplegar la aplicación en Kubernetes, ejecuta:

```bash
kubectl apply -f deploy-hello-python.yaml
```

## Verificar el despliegue

Verificar los pods:

```bash
kubectl get pods -l app=hello-python
```

Verificar el servicio:

```bash
kubectl get service hello-python-service
```

## Acceder a la aplicación

Si estás usando Minikube:

```bash
minikube service hello-python-service
```

O accede directamente a:
- `http://localhost:30080/`
- `http://<node-ip>:30080/`

## Eliminar el despliegue

Para eliminar todos los recursos:

```bash
kubectl delete -f deploy-hello-python.yaml
```
