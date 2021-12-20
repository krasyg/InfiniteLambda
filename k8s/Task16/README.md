## Create secret with env variable

```

$ kubectl create secret generic my-secret --from-literal=MY_HOST=www.google.com
```
## pod.yaml

```
apiVersion: v1
kind: Pod
metadata:
    name: mypod
spec:
    containers:
      - name: myapp
        image: krasyg/ping-app
        env:
        - name: MY_HOST
          valueFrom:
             secretKeyRef:
              name: my-secret
              key: MY_HOST
```

```

$ kubectl exec mypod -it -- bash
bash-5.1# printenv
MY_HOST=www.google.com
```

```

$ kubectl logs mypod
PING www.google.com (172.217.169.100): 56 data bytes
64 bytes from 172.217.169.100: seq=0 ttl=115 time=4.087 ms
64 bytes from 172.217.169.100: seq=1 ttl=115 time=3.045 ms
64 bytes from 172.217.169.100: seq=2 ttl=115 time=7.033 ms
64 bytes from 172.217.169.100: seq=3 ttl=115 time=3.158 ms
64 bytes from 172.217.169.100: seq=4 ttl=115 time=2.979 ms

--- www.google.com ping statistics ---
5 packets transmitted, 5 packets received, 0% packet loss
round-trip min/avg/max = 2.979/4.060/7.033 ms
PING www.google.com (172.217.169.100): 56 data bytes
64 bytes from 172.217.169.100: seq=0 ttl=115 time=3.361 ms
64 bytes from 172.217.169.100: seq=1 ttl=115 time=1.997 ms
64 bytes from 172.217.169.100: seq=2 ttl=115 time=3.408 ms
64 bytes from 172.217.169.100: seq=3 ttl=115 time=3.651 ms
64 bytes from 172.217.169.100: seq=4 ttl=115 time=1.949 ms
```

