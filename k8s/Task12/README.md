## Create nginx docker image with modified index.html

**Dockerfile**
```
FROM nginx:latest
COPY ./index.html /usr/share/nginx/html/index.html
```
**index.html**

```
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>Krasi's Nginx Image</title>
</head>
<body>
  <h2>Hello from Krasi's Nginx container</h2>
</body>
</html>

$ docker build -t webserver .
$ docker run -it --rm -p 8080:80 --name web webserver

```
## Push to personal docker hub repo

```
$ docker login
$ docker tag webserver krasyg/webserver
$ docker push krasyg/webserver
```

## Create deployment & service and expose port 

### Yaml file

```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: webserver
spec:
  selector:
    matchLabels:
      app: webserver
  replicas: 1
  template: 
    metadata:
      labels:
        app: webserver
    spec:
      containers:
      - name: tassk12-webserver 
        image: krasyg/webserver
        ports:
        - containerPort: 80

---

apiVersion: v1
kind: Service
metadata:
  name: webserver
  labels:
    app: webserver
spec:
  ports:
  - name: http
    port: 8080
    protocol: TCP
    targetPort: 80
  selector:    
    app: webserver
  type: NodePort
```

```
$ kubectl apply -f depl.yaml
$ minikube service webserver --url
```
![screen_before](https://user-images.githubusercontent.com/84388046/146354536-da374543-ec2a-4e9b-acd6-8cf0915b5614.jpg)


## Modify index.html from inside the container

```
$ kubectl exec webserver-7c8569bdbb-m7m57 -it -- /bin/bash

root@webserver-7c8569bdbb-m7m57:/# apt-get update
root@webserver-7c8569bdbb-m7m57:/# apt-get install -y vim
```
![screen_after](https://user-images.githubusercontent.com/84388046/146355155-4365e3db-4904-4756-824a-48dca004dd17.jpg)



