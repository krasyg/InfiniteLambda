## Create service account and role, attach rolebinding

**create.yaml**

```

---
apiVersion: v1
kind: ServiceAccount
metadata:
  name: test-user

---
kind: Role
apiVersion: rbac.authorization.k8s.io/v1
metadata:
  name: test-role
rules:
- apiGroups: [""]
  resources: ["pods"]
  verbs: ["create","delete","get","list","patch","update","watch"]

---
apiVersion: rbac.authorization.k8s.io/v1
kind: RoleBinding
metadata:
  name: test-binding
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: Role
  name: test-role
subjects:
- kind: ServiceAccount
  name: test-user
```

## Create pod containing kubectl

**pod.yaml**

```

apiVersion: v1
kind: Pod
metadata:
  name: kubectl-pod
  labels:
    app: test-app
spec:
  serviceAccountName: test-user
  containers:
    - name: test-app
      image: bitnami/kubectl
      command: [ "/bin/bash", "-c", "--" ]
      args: [ "while true; do sleep 30; done;" ]
```

## Connect to the pod

```
$ kubectl exec kubectl-pod -it -- /bin/bash 

I have no name!@kubectl-pod:/$ ls
bin  boot  dev  etc  home  lib  lib64  media  mnt  opt  proc  root  run  sbin  srv  sys  tmp  usr  var
```
