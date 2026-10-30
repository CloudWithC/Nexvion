# Nexvion – Kubernetes Deployment

## Overview
Nexvion is deployed on a local Kubernetes cluster using Kind.

## Kubernetes Resources
- **Namespace:** `nexvion`
- **Deployment:** `nexvion`
- **Replicas:** 2
- **Container Image:** `nexvion-web:v1`
- **Service:** `nexvion-service` (NodePort 30088)
- **ConfigMap:** `nexvion-config`
- **Secret:** `nexvion-secret` (demo placeholder only)

## Deployment

Load the Docker image into the existing Kind cluster:

```bash
kind load docker-image nexvion-web:v1 --name cib-cluster
```

Apply the Kubernetes resources:

```bash
kubectl apply -f kubernetes/namespace.yaml
kubectl apply -f kubernetes/configmap.yaml
kubectl apply -f kubernetes/secret.yaml
kubectl apply -f kubernetes/deployment.yaml
kubectl apply -f kubernetes/service.yaml
kubectl rollout status deployment/nexvion -n nexvion --timeout=120s
```

## Verification

Check Kubernetes resources:

```bash
kubectl get all -n nexvion
```

Access the website using port forwarding:

```bash
kubectl port-forward -n nexvion service/nexvion-service 18088:80
```

In another terminal, verify the website pages:

```bash
curl -I http://localhost:18088/
curl -I http://localhost:18088/products.html
curl -I http://localhost:18088/payment.html
```

All three pages returned **HTTP 200 OK** during testing.

## Rolling Restart

A rolling restart was tested successfully:

```bash
kubectl rollout restart deployment/nexvion -n nexvion
kubectl rollout status deployment/nexvion -n nexvion --timeout=120s
kubectl get pods -n nexvion
```

## Rollback Test

An unavailable image (`nexvion-web:bad`) was temporarily assigned to simulate a failed deployment.

Kubernetes reported an image-pull error. The previous working deployment was restored successfully:

```bash
kubectl rollout undo deployment/nexvion -n nexvion
kubectl rollout status deployment/nexvion -n nexvion --timeout=120s
kubectl get deployments,pods -n nexvion
```

The deployment returned to **2/2 available replicas**.

## Notes
- Tested on the existing local Kind cluster named `cib-cluster`.
- The Kubernetes Secret contains a demo placeholder, not a production credential.
- The NodePort service uses port `30088`.
- Website verification was performed using `kubectl port-forward`.
