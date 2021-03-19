#!/bin/bash
kubectl cluster-info > /dev/null 2>&1

if [ $? -eq 0 ]; then
	kubectl delete statefulset redis-slave
	kubectl delete statefulset redis
	kubectl delete statefulset postgres
	kubectl delete statefulset postgres-replica
	kubectl delete deployment lb
else
	echo "Kubernetes cluster not found. Stopping failed."
fi
