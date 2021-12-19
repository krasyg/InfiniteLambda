## Create PV and PVC

```
apiVersion: v1
kind: PersistentVolume
metadata:
  name: mysql-vol
  labels:
    type: local
spec:
  storageClassName: manual
  capacity:
    storage: 2Gi
  accessModes:
    - ReadWriteOnce
  hostPath:
    path: "/mnt/k8s-vol"
---
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: mysql-volclaim
spec:
  storageClassName: manual
  accessModes:
    - ReadWriteOnce
  resources:
    requests:
      storage: 2Gi
```
## Create deployment and service

```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: mysql
spec:
  replicas: 2
  selector:
    matchLabels:
      app: mysql
  template:
    metadata:
      labels:
        app: mysql
    spec:
      containers:
      - image: mysql:5.6
        name: mysql
        env:
        - name: MYSQL_ROOT_PASSWORD
          valueFrom:
            secretKeyRef:
              name: mysql-secret
              key: password
        ports:
        - containerPort: 3306
          name: mysql
        volumeMounts:
        - name: mysql-storage
          mountPath: /var/lib/mysql
      volumes:
      - name: mysql-storage
        persistentVolumeClaim:
          claimName: mysql-volclaim
---
apiVersion: v1
kind: Service
metadata:
  name: mysql
spec:
  type: ClusterIP
  ports:
  - port: 3306
    targetPort: 80
  selector:
    app: mysql
```

```
$ kubectl get pv,pvc
NAME                               CAPACITY   ACCESS MODES   RECLAIM POLICY   STATUS   CLAIM                    STORAGECLASS   REASON   AGE
persistentvolume/mysql-pv-volume   2Gi        RWO            Retain           Bound    default/mysql-pv-claim   manual                  2d4h
persistentvolume/mysql-vol         2Gi        RWO            Retain           Bound    default/mysql-volclaim   manual                  2d4h

$ kubectl get deployment,svc 
NAME                               READY   UP-TO-DATE   AVAILABLE   AGE
deployment.apps/mysql              1/2     2            1           2d4h

NAME                       TYPE        CLUSTER-IP      EXTERNAL-IP   PORT(S)          AGE
service/mysql              ClusterIP   10.107.76.14    <none>        3306/TCP         2d4h
```
