## Imperative

```
$ kubectl create deployment task7 --image=joji95/k8s-static-web-app --port=80

$ kubectl expose deployment task7 --protocol=TCP --type=NodePort --port=8080 --target-port=80 --name=task7-svc

$ minikube service task7-svc
```

!(home/krasi/Downloads/Screenshot.jpg)
