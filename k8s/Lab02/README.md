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

Name:                 coredns-78fcd69978-94868
Namespace:            kube-system
Priority:             2000000000
Priority Class Name:  system-cluster-critical
Node:                 minikube/192.168.49.2
Start Time:           Mon, 13 Dec 2021 10:14:21 +0200
Labels:               k8s-app=kube-dns
                      pod-template-hash=78fcd69978
Annotations:          <none>
Status:               Running
IP:                   172.17.0.2
IPs:
  IP:           172.17.0.2
Controlled By:  ReplicaSet/coredns-78fcd69978
Containers:
  coredns:
    Container ID:  docker://d7a8710d03dc2cb64885938ab37d8451f58b2333da4b5bc99e848b1933e6cd23
    Image:         k8s.gcr.io/coredns/coredns:v1.8.4
    Image ID:      docker://sha256:8d147537fb7d1ac8895da4d55a5e53621949981e2e6460976dae812f83d84a44
    Ports:         53/UDP, 53/TCP, 9153/TCP
    Host Ports:    0/UDP, 0/TCP, 0/TCP
    Args:
      -conf
      /etc/coredns/Corefile
    State:          Running
      Started:      Mon, 13 Dec 2021 10:14:27 +0200
    Ready:          True
    Restart Count:  0
    Limits:
      memory:  170Mi
    Requests:
      cpu:        100m
      memory:     70Mi
    Liveness:     http-get http://:8080/health delay=60s timeout=5s period=10s #success=1 #failure=5
    Readiness:    http-get http://:8181/ready delay=0s timeout=1s period=10s #success=1 #failure=3
    Environment:  <none>
    Mounts:
      /etc/coredns from config-volume (ro)
      /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-s5mh6 (ro)
Conditions:
  Type              Status
  Initialized       True 
  Ready             True 
  ContainersReady   True 
  PodScheduled      True 
Volumes:
  config-volume:
    Type:      ConfigMap (a volume populated by a ConfigMap)
    Name:      coredns
    Optional:  false
  kube-api-access-s5mh6:
    Type:                    Projected (a volume that contains injected data from multiple sources)
    TokenExpirationSeconds:  3607
    ConfigMapName:           kube-root-ca.crt
    ConfigMapOptional:       <nil>
    DownwardAPI:             true
QoS Class:                   Burstable
Node-Selectors:              kubernetes.io/os=linux
Tolerations:                 CriticalAddonsOnly op=Exists
                             node-role.kubernetes.io/control-plane:NoSchedule
                             node-role.kubernetes.io/master:NoSchedule
                             node.kubernetes.io/not-ready:NoExecute op=Exists for 300s
                             node.kubernetes.io/unreachable:NoExecute op=Exists for 300s
Events:                      <none>


```
