## Create new chart

```
$ helm create chart-1
```

## values.yaml

```
image:
  repository: nginx
  pullPolicy: IfNotPresent
  tag: latest
```

## Install new chart 

```
$ helm install my-chart-1 chart-1
NAME: my-chart-1
LAST DEPLOYED: Tue Dec 21 11:29:53 2021
NAMESPACE: default
STATUS: deployed
REVISION: 1
TEST SUITE: None
```

## List releases 

```
$ helm ls
NAME            NAMESPACE       REVISION        UPDATED                                 STATUS          CHART           APP VERSION
my-chart-1      default         1               2021-12-21 11:29:53.789768818 +0200 EET deployed        chart-1-0.1.0   1.16.0   
```

## Change img to redis:latest

```
$ helm upgrade my-chart-1 chart-1 --set=image.repository=redis --set=image.tag=latest

Release "my-chart-1" has been upgraded. Happy Helming!
NAME: my-chart-1
LAST DEPLOYED: Tue Dec 21 11:34:23 2021
NAMESPACE: default
STATUS: deployed
REVISION: 2
TEST SUITE: None
```

## List releases

```

$ helm ls
NAME            NAMESPACE       REVISION        UPDATED                                 STATUS          CHART           APP VERSION
my-chart-1      default         2               2021-12-21 11:34:23.779237558 +0200 EET deployed        chart-1-0.1.0   1.16.0     
```

