```yml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: premier-league-db
  namespace: default
spec:
  replicas: 1
  selector:
    matchLabels:
      app: premier-league-db
  template:
    metadata:
      labels:
        app: premier-league-db
    spec:
      containers:
      - name: premier-league-db
        image: emilesherrott/pl-db-cloud:0.0.1.RELEASE
        ports:
        - containerPort: 5432
        env:
        - name: DB_USER
          valueFrom:
            configMapKeyRef:
              name: premier-league-config
              key: DB_USER
        - name: DB_PASSWORD
          valueFrom:
            configMapKeyRef:
              name: premier-league-config
              key: DB_PASSWORD

---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: premier-league-mvc
  namespace: default
spec:
  replicas: 2
  selector:
    matchLabels:
      app: premier-league-mvc
  template:
    metadata:
      labels:
        app: premier-league-mvc
    spec:
      containers:
      - name: premier-league-mvc
        image: emilesherrott/pl-mvc-cloud:0.0.1.RELEASE
        ports:
        - containerPort: 80
        env:
        - name: PORT
          value: "80"
        - name: DB_HOST
          value: premier-league-db
        - name: DB_PORT
          value: "5432"
        - name: DB_USER
          valueFrom:
            configMapKeyRef:
              name: premier-league-config
              key: DB_USER
        - name: DB_PASSWORD
          valueFrom:
            configMapKeyRef:
              name: premier-league-config
              key: DB_PASSWORD
        - name: DB_NAME
          valueFrom:
            configMapKeyRef:
              name: premier-league-config
              key: DB_NAME

---
apiVersion: v1
kind: Service
metadata:
  name: premier-league-service
  namespace: default
spec:
  selector:
    app: premier-league-mvc
  ports:
    - protocol: TCP
      port: 80
      targetPort: 80
  type: LoadBalancer

---
apiVersion: v1
kind: ConfigMap
metadata:
  name: premier-league-config
  namespace: default
data:
  DB_USER: "postgres"
  DB_PASSWORD: "docker"
  DB_NAME: "premier-league"
```