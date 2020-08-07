# k8s-speadsheet
Work with cluster and resources using kubectl

Here i suggest different scenario with resources in cluster(cloud-managed, bare-metal and local such as minikube)
Before starting work with cluster you can see on this [article](https://learnk8s.io/blog/kubectl-productivity)

## Get all pods with same release

Usually metadata consists field `labels` and one of popular labels is release

```bash
$>kubectl get po -o=jsonpath='{range .items[*]}{.metadata.name}{"\t"}{.metadata.labels.release}{"\n"}{end}'
```
The expression selecting name of each pod and `release` from `.metadata.labels`

Get all pods with same release

```bash
kubectl get po -l release=<my-release>
```

