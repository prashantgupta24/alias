# Kubernetes useful commands

## Service to use an external IP address

Patch a service to use an external IP address

```
kubectl patch svc <svc-name> -n <namespace> -p '{"spec": {"type": "LoadBalancer", "externalIPs":["172.31.71.218"]}}'
```

Patch a service to change to LoadBalancer

```
kubectl -n <namespace> patch svc <svc-name> -p '{"spec": {"type": "LoadBalancer"}}'
```

Define a service with LoadBalancer and assign an external IP address.

```
...
spec:
  type: LoadBalancer
  externalIPs:
  - 192.168.0.10
```

Find out the external IP address used by the nginx controller

```
kubectl -n kube-system get svc nginx-controller -o jsonpath="{.status.loadBalancer.ingress[0].ip}"
```

## Pod stuck in termintaing mode

```

```

