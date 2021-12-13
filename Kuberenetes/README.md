## Install Minikube and kubectl

```
Client Version: version.Info{Major:"1", Minor:"23", GitVersion:"v1.23.0", GitCommit:"ab69524f795c42094a6630298ff53f3c3ebab7f4", GitTreeState:"clean", BuildDate:"2021-12-07T18:16:20Z", GoVersion:"go1.17.3", Compiler:"gc", Platform:"linux/amd64"}
Server Version: version.Info{Major:"1", Minor:"22", GitVersion:"v1.22.3", GitCommit:"c92036820499fedefec0f847e2054d824aea6cd1", GitTreeState:"clean", BuildDate:"2021-10-27T18:35:25Z", GoVersion:"go1.16.9", Compiler:"gc", Platform:"linux/amd64"}

minikube version: v1.24.0
commit: 76b94fb3c4e8ac5062daf70d60cf03ddcc0a741b

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
