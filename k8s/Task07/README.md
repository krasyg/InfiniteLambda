## Imperative

```
$ kubectl create deployment task7 --image=joji95/k8s-static-web-app --port=80

$ kubectl expose deployment task7 --protocol=TCP --type=NodePort --port=8080 --target-port=80 --name=task7-svc

$ minikube service task7-svc
```

![Screenshot](https://user-images.githubusercontent.com/84388046/146220469-3bf96f99-b1a2-4fe6-8df5-f7113802b1ff.jpg)
