## Create namespace test

```
kubectl create namespace test
```

## Confingmap.yaml
```

apiVersion: v1
kind: ConfigMap
metadata:
  name: configmap
  namespace: test
data:
  myvariable: "{{.Values.data.myvar}}"
```

## Secret.yaml
```

apiVersion: v1
kind: Secret
metadata:
  name: "secrets"
  namespace: test
type: Opaque
dataString:
  variable: "{{.Values.data.myvar2}}"
```

## Deployment.yaml

```

apiVersion: apps/v1
kind: Deployment
metadata:
  name: "depl"
namespace: test
spec:
  template:
    metadata:
      {{- with .Values.podAnnotations }}
      annotations:
        {{- toYaml . | nindent 8 }}
      {{- end }}
    spec:
      {{- with .Values.imagePullSecrets }}
      imagePullSecrets:
        {{- toYaml . | nindent 8 }}
      {{- end }}
      containers:
        - name: {{ .Chart.Name }}
          securityContext:
            {{- toYaml .Values.securityContext | nindent 12 }}
          image: "{{ .Values.image.repository }}:{{ .Values.image.tag | default .Chart.AppVersion }}"
          imagePullPolicy: {{ .Values.image.pullPolicy }}
          env: 
            -name: "map-env"
            valueFrom:
              configMapKeyRef:
                name: configmap
                key: myvariable
            -name: "sec-env"
            valueFrom:
              secretKeyRef:
                name: secrets
                key: variable
```

## Values.yaml
```
...
# Default values for task18.
# This is a YAML-formatted file.
# Declare variables to be passed into your templates.


image:
  repository: nginx
  pullPolicy: IfNotPresent
  # Overrides the image tag whose default is the chart appVersion.
  tag: latest

...

data: 
  myvar: 5
  myvar2: 6
```

