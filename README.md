# ha_redis_postgres
## High Avaibility Redis and PostgreSQL

1. Your master node must have node-role.kubernetes.io/master=master label and your worker nodes must have node-role.kubernetes.io/worker: worker
1. Your all nodes must have /mnt/pv-data/redis-sentinel/sentinel.conf file. (Yo can find config file from configs directory)
1. Enjoy!
