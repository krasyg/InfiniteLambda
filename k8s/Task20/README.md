## Deployment with two replicas on affinity node

```

apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx
spec:
  replicas: 2
  selector:
    matchLabels:
      app: nginx
  template:
    metadata:
      labels:
        app: nginx
    spec:
      topologySpreadConstraints:
      - maxSkew: 2
        topologyKey: "kubernetes.io/hostname"
        whenUnsatisfiable: DoNotSchedule
        labelSelector:
          matchLabels:
            app: nginx
      affinity:
        nodeAffinity:
          requiredDuringSchedulingIgnoredDuringExecution:
            nodeSelectorTerms:
            - matchExpressions: 
              - key: "kubernetes.io/hostname"
                operator: In
                values: 
                - "minikube-m02"
      containers:
      - name: testing-affinity
        image: nginx
        imagePullPolicy: IfNotPresent
 ```
 
 ```
 $ kubectl get nodes -L kubernetes.io/hostname
NAME           STATUS   ROLES                  AGE     VERSION   HOSTNAME
minikube       Ready    control-plane,master   9d      v1.22.3   minikube
minikube-m02   Ready    <none>                 3h31m   v1.22.3   minikube-m02

$ kubectl get pod -o=custom-columns=NODE:.spec.nodeName,NAME:.metadata.name --all-namespaces
NODE           NAME
minikube-m02   nginx-5658fb5b5c-kwf67
minikube-m02   nginx-5658fb5b5c-ltqpf
```
