## Create vish/stress img pod with cpu request of 0,5 and limit of 1. Allocate 2 cpus with stress

```
$ kubectl create namespace cpu-ns
namespace/cpu-ns created

$ kubectl apply -f pod.yaml -n cpu-ns
pod/cpu-pod created

$ kubectl top pod cpu-pod -n cpu-ns
NAME      CPU(cores)   MEMORY(bytes)   
cpu-pod   999m         1Mi   
```
