# ha_redis_postgres

Your master node must have node-role.kubernetes.io/master=master label and your worker nodes must have node-role.kubernetes.io/worker: worker
Your all nodes must have /mnt/pv-data/redis-sentinel/sentinel.conf file. (Yo can find config file from configs directory and you must change master node's ip)
Enjoy it!