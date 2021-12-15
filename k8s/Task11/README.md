## Create vish/stress img pod with cpu request of 100 and limit of 100. Try to use 2 cpus

```

$ kubectl top pod over-cpu-pod -n cpu-ns
Error from server (NotFound): podmetrics.metrics.k8s.io "cpu-ns/over-cpu-pod" not found

$ kubectl get pod over-cpu-pod -n cpu-ns
NAME           READY   STATUS    RESTARTS   AGE
over-cpu-pod   0/1     Pending   0          77s
```
