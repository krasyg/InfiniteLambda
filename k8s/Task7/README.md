## Imperative 


```
$ kubectl run task7 --image=joji95/k8s-static-web-app --port=80 -n tasks
$ kubectl expose pod -n tasks task7 --type=NodePort --port=80 
```

```
$ kubectl describe service -n tasks task7

Name:                     task7
Namespace:                tasks
Labels:                   run=task7
Annotations:              <none>
Selector:                 run=task7
Type:                     NodePort
IP Family Policy:         SingleStack
IP Families:              IPv4
IP:                       10.104.141.142
IPs:                      10.104.141.142
Port:                     <unset>  80/TCP
TargetPort:               80/TCP
NodePort:                 <unset>  30973/TCP
Endpoints:                172.17.0.2:80
Session Affinity:         None
External Traffic Policy:  Cluster
Events:                   <none>
```
```
$ minikube service task7 -n tasks
|-----------|-------|-------------|---------------------------|
| NAMESPACE | NAME  | TARGET PORT |            URL            |
|-----------|-------|-------------|---------------------------|
| tasks     | task7 |          80 | http://192.168.49.2:30973 |
|-----------|-------|-------------|---------------------------|
🎉  Opening service tasks/task7 in default browser...
```
```

Unable to connect

Firefox can’t establish a connection to the server at 192.168.49.2:30973.

```
