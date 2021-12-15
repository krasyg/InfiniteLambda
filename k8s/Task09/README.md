## Create polinux/stress img pod with memory request of 50MiB and limit of 100MiB. Allocate 250MiB with stress

```

$ kubectl apply -f pod.yaml -n limits

$ kubectl top pod over-memo-pod -n limits
NAME            CPU(cores)   MEMORY(bytes)   
over-memo-pod   0m           0Mi      

$ kubectl get pods over-memo-pod -n limits
NAME            READY   STATUS             RESTARTS       AGE
over-memo-pod   0/1     CrashLoopBackOff   5 (102s ago)   5m14s
```
