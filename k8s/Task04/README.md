## Create Ubuntu deployment and get information about running deployments on cluster

```
kubectl apply -f deployment.yaml 

$ kubectl describe deployments

Name:                   myapp
Namespace:              default
CreationTimestamp:      Mon, 13 Dec 2021 16:57:09 +0200
Labels:                 <none>
Annotations:            deployment.kubernetes.io/revision: 2
Selector:               app=myapp
Replicas:               2 desired | 2 updated | 2 total | 2 available | 0 unavailable
StrategyType:           RollingUpdate
MinReadySeconds:        0
RollingUpdateStrategy:  25% max unavailable, 25% max surge
Pod Template:
  Labels:  app=myapp
  Containers:
   myapp:
    Image:      amigoscode/kubernetes:springboot-react-fullstack-v1
    Port:       8080/TCP
    Host Port:  0/TCP
    Limits:
      cpu:        500m
      memory:     512Mi
    Environment:  <none>
    Mounts:       <none>
  Volumes:        <none>
Conditions:
  Type           Status  Reason
  ----           ------  ------
  Progressing    True    NewReplicaSetAvailable
  Available      True    MinimumReplicasAvailable
OldReplicaSets:  <none>
NewReplicaSet:   myapp-554fffc494 (2/2 replicas created)
Events:          <none>


Name:                   nginx-deployment
Namespace:              default
CreationTimestamp:      Mon, 13 Dec 2021 11:24:28 +0200
Labels:                 <none>
Annotations:            deployment.kubernetes.io/revision: 2
Selector:               app=nginx
Replicas:               2 desired | 2 updated | 2 total | 2 available | 0 unavailable
StrategyType:           RollingUpdate
MinReadySeconds:        0
RollingUpdateStrategy:  25% max unavailable, 25% max surge
Pod Template:
  Labels:  app=nginx
  Containers:
   nginx:
    Image:        nginx:stable
    Port:         80/TCP
    Host Port:    0/TCP
    Environment:  <none>
    Mounts:       <none>
  Volumes:        <none>
Conditions:
  Type           Status  Reason
  ----           ------  ------
  Available      True    MinimumReplicasAvailable
  Progressing    True    NewReplicaSetAvailable
OldReplicaSets:  <none>
NewReplicaSet:   nginx-deployment-5ff58d798d (2/2 replicas created)
Events:          <none>


Name:                   ubuntu-deploy
Namespace:              default
CreationTimestamp:      Tue, 14 Dec 2021 12:24:04 +0200
Labels:                 app=ubuntu
Annotations:            deployment.kubernetes.io/revision: 1
Selector:               app=ubuntu
Replicas:               1 desired | 1 updated | 1 total | 1 available | 0 unavailable
StrategyType:           RollingUpdate
MinReadySeconds:        0
RollingUpdateStrategy:  25% max unavailable, 25% max surge
Pod Template:
  Labels:  app=ubuntu
  Containers:
   ubuntu:
    Image:      ubuntu
    Port:       <none>
    Host Port:  <none>
    Command:
      sleep
      3600
    Environment:  <none>
    Mounts:       <none>
  Volumes:        <none>
Conditions:
  Type           Status  Reason
  ----           ------  ------
  Available      True    MinimumReplicasAvailable
  Progressing    True    NewReplicaSetAvailable
OldReplicaSets:  <none>
NewReplicaSet:   ubuntu-deploy-755b476648 (1/1 replicas created)
Events:
  Type    Reason             Age   From                   Message
  ----    ------             ----  ----                   -------
  Normal  ScalingReplicaSet  105m  deployment-controller  Scaled up replica set ubuntu-deploy-755b476648 to 1
  
  ```
