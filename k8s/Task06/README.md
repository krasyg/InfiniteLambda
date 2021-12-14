## Create job that spawns (3) pods

```

$ kubectl apply -f job.yaml
job.batch/msg-timer created

$ kubectl get pods --watch
NAME                                READY   STATUS    RESTARTS        AGE
msg-timer--1-kdzdb                  0/1     Pending   0               0s
msg-timer--1-kdzdb                  0/1     ContainerCreating   0               0s
msg-timer--1-kdzdb                  1/1     Running             0               9s
msg-timer--1-kdzdb                  0/1     Completed           0               12s
msg-timer--1-48q44                  0/1     Pending             0               0s
msg-timer--1-48q44                  0/1     Pending             0               0s
msg-timer--1-48q44                  0/1     ContainerCreating   0               0s
msg-timer--1-48q44                  1/1     Running             0               9s
msg-timer--1-48q44                  0/1     Completed           0               12s
msg-timer--1-ft5v2                  0/1     Pending             0               0s
msg-timer--1-ft5v2                  0/1     Pending             0               0s
msg-timer--1-ft5v2                  0/1     ContainerCreating   0               1s
msg-timer--1-ft5v2                  1/1     Running             0               12s
msg-timer--1-ft5v2                  0/1     Completed           0               15s

$ kubectl logs msg-timer--1-ft5v2
one message to be printed
```
