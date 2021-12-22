## Tainted node
```
$ kubectl taint nodes minikube-m02 mykey=myvalue:NoSchedule
```

## Pod w same key/value pair
```

apiVersion: v1
kind: Pod
metadata:
  name: nginx
  labels:
    env: test
spec:
  containers:
  - name: nginx
    image: nginx
    imagePullPolicy: IfNotPresent
  tolerations:
  - key: "mykey"
    operator: "Equal"
    value: "myvalue"
    effect: "NoSchedule"
```

## Pod w toleration if key exists
```

apiVersion: v1
kind: Pod
metadata:
  name: nginx2
  labels:
    env: test
spec:
  containers:
  - name: nginx
    image: nginx
    imagePullPolicy: IfNotPresent
  tolerations:
  - key: "mykey"
    operator: "Exists"
    # effect: "PreferNoSchedule"
```

## TEST-pod if key is different
```

apiVersion: v1
kind: Pod
metadata:
  name: nginx3
  labels:
    env: test
spec:
  containers:
  - name: nginx
    image: nginx
    imagePullPolicy: IfNotPresent
  tolerations:
  - key: "mykey12"
    operator: "Exists"
    # value: "value"
    # effect: "PreferNoSchedule"
```
## $ kubectl get pod -o=custom-columns=NODE:.spec.nodeName,NAME:.metadata.name --all-namespaces
```
 
minikube-m02   nginx
minikube-m02   nginx2
minikube       nginx3
```
