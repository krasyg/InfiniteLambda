## Create ping bash

```
#!/usr/bin/env

# MY_HOST="www.google.com"

while true
do 
    ping -c 5 $MY_HOST
    sleep 5
done
```

## Build and push img

**Dockerfile**
```
FROM bash
COPY ping.sh .

CMD ["bash", "ping.sh"]
```
```
$ docker build -t krasyg/ping-app .
$ docker login
$ docker push krasyg/ping-app
```

## Create configmap

```
$ kubectl create configmap config-env --from-env-file=/home/krasi/MY_HOST
```
**pod.yaml**
```
kind: Pod
apiVersion: v1
metadata:
  name: ping-app
spec:
  containers:
    - name: ping-pod
      image: krasyg/ping-app
      envFrom:
        - configMapRef:
            name: config-env
```

## Container logs

```

$ kubectl logs ping-app

PING www.google.com (172.217.20.68): 56 data bytes
64 bytes from 172.217.20.68: seq=0 ttl=116 time=4.394 ms
64 bytes from 172.217.20.68: seq=1 ttl=116 time=10.551 ms
64 bytes from 172.217.20.68: seq=2 ttl=116 time=2.743 ms
64 bytes from 172.217.20.68: seq=3 ttl=116 time=2.083 ms
64 bytes from 172.217.20.68: seq=4 ttl=116 time=9.038 ms

--- www.google.com ping statistics ---
5 packets transmitted, 5 packets received, 0% packet loss
round-trip min/avg/max = 2.083/5.761/10.551 ms
PING www.google.com (172.217.20.68): 56 data bytes
64 bytes from 172.217.20.68: seq=0 ttl=116 time=2.645 ms
64 bytes from 172.217.20.68: seq=1 ttl=116 time=34.877 ms
64 bytes from 172.217.20.68: seq=2 ttl=116 time=4.949 ms
64 bytes from 172.217.20.68: seq=3 ttl=116 time=9.877 ms
64 bytes from 172.217.20.68: seq=4 ttl=116 time=4.024 ms

...
```
```
$ kubectl exec -it ping-app -- bash
bash-5.1# printenv
MY_HOST=www.google.com
```

## Mount configmap into pod


**pod.yaml v2**

```
kind: Pod
apiVersion: v1
metadata:
  name: test-pod-2
spec:
  containers:
    - name: test-container
      image: krasyg/ping-app
      envFrom:
        - configMapRef:
            name: config-env
      command: ["printenv"]
      args: ["MY_HOST"]
```
```
$ kubectl logs test-pod-2
www.google.com

command is being overwritten 
```
