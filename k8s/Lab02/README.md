## Start Minikube with specific CPU and memory 

```
$ minikube start --memory 2048 --cpus 2

```


## List detailed information on services 

```
$ kubectl describe services

Name:              kubernetes
Namespace:         default
Labels:            component=apiserver
                   provider=kubernetes
Annotations:       <none>
Selector:          <none>
Type:              ClusterIP
IP Family Policy:  SingleStack
IP Families:       IPv4
IP:                10.96.0.1
IPs:               10.96.0.1
Port:              https  443/TCP
TargetPort:        8443/TCP
Endpoints:         192.168.49.2:8443
Session Affinity:  None
Events:            <none>

```

## List all pods

```
$ kubectl get pods --all-namespaces

NAMESPACE     NAME                               READY   STATUS    RESTARTS      AGE
kube-system   coredns-78fcd69978-94868           1/1     Running   0             26m
kube-system   etcd-minikube                      1/1     Running   0             26m
kube-system   kube-apiserver-minikube            1/1     Running   0             26m
kube-system   kube-controller-manager-minikube   1/1     Running   0             26m
kube-system   kube-proxy-mgn64                   1/1     Running   0             26m
kube-system   kube-scheduler-minikube            1/1     Running   0             26m
kube-system   storage-provisioner                1/1     Running   1 (25m ago)   26m
```

## Detailed info on pod

```
$ kubectl describe pod -n kube-system coredns-78fcd69978-94868

```
