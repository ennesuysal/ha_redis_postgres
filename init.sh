mkdir -pv /mnt/pv-data/redis-sentinel
cp -v configs/sentinel.conf /mnt/pv-data/redis-sentinel
create -f configs/configMap.yaml
create -f volumes/pv_db.yaml
create -f volumes/pv_redis_sentinel.yaml
create -f services/postgres_primary.yaml
create -f services/postgres_replica.yaml
create -f services/redis-master.yaml