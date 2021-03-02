mkdir -pv /mnt/pv-data/redis-sentinel
cp -v configs/sentinel.conf /mnt/pv-data/redis-sentinel
kubectl create -f configs/configMap.yaml
kubectl create -f volumes/pv_db.yaml
kubectl create -f volumes/pv_redis_sentinel.yaml
kubectl create -f services/postgres_primary.yaml
kubectl create -f services/postgres_replica.yaml
kubectl create -f services/redis-master.yaml
kubectl create -f services/redis-slave.yaml
