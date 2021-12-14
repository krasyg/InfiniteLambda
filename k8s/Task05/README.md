## Create cron job (from yaml file)

```
$ kubectl create -f cronjob.yaml
```
## View result

```
$ kubectl get jobs
NAME             COMPLETIONS   DURATION   AGE
hello-27324770   1/1           9s         2m40s
hello-27324771   1/1           9s         100s
hello-27324772   1/1           13s        40s

$ kubectl get cronjobs
NAME    SCHEDULE      SUSPEND   ACTIVE   LAST SCHEDULE   AGE
hello   */1 * * * *   False     0        56s             13m

$ kubectl logs hello-27324777--1-vl9jb
12:57:11
Hello every mitnute

```

## Delete job

```
kubectl delete cronjob hello
```

