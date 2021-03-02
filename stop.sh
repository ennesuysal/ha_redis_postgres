#!/bin/bash
kubectl delete statefulset redis-slave
kubectl delete statefulset redis
kubectl delete statefulset postgres
kubectl delete statefulset postgres-replica
kubectl delete deployment lb