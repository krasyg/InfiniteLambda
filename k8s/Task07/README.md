## Imperative

```
$ kubectl create deployment task7 --image=joji95/k8s-static-web-app --port=80

$ kubectl expose deployment task7 --protocol=TCP --type=NodePort --port=8080 --target-port=80 --name=task7-svc

$ minikube service task7-svc
```

![Screenshot](https://user-images.githubusercontent.com/84388046/146220469-3bf96f99-b1a2-4fe6-8df5-f7113802b1ff.jpg)


## Declarative 

```
$ kubectl apply -f deployment.yaml 
deployment.apps/lab7 created

$ kubectl apply -f service.yaml 
service/lab7 created

$ minikube service lab7
|-----------|------|-------------|---------------------------|
| NAMESPACE | NAME | TARGET PORT |            URL            |
|-----------|------|-------------|---------------------------|
| default   | lab7 | http/8080   | http://192.168.49.2:32111 |
|-----------|------|-------------|---------------------------|
🎉  Opening service default/lab7 in default browser...
```
![Screenshot_2](https://user-images.githubusercontent.com/84388046/146223172-22b17ffa-abbc-4cde-bc69-7948048c829b.jpg)


