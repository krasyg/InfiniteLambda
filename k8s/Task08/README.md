## Create polinux/stress img pod with memory request of 100MiB and limit of 200MiB. Allocate 150MiB with stress

```

$ kubectl create namespace limits
$ kubectl apply -f pod.yaml -n limits
$ kubectl get pod memo-pod --output=yaml -n limits

...
resources:
  limits:
    memory: 200Mi
  requests:
    memory: 100Mi
...

$ kubectl top pod memo-pod -n limits

NAME       CPU(cores)   MEMORY(bytes)   
memo-pod   69m          150Mi  
```
