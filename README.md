## High Availability Redis and PostgreSQL

### Requirements
- Your master node must have node-role.kubernetes.io/master=master label
- Your worker nodes must have node-role.kubernetes.io/worker=worker label
- Your all nodes must have /mnt/pv-data/redis-sentinel/sentinel.conf file. (You can find config file from configs directory)

#### init.sh meets these requirements but not the last.

- You must enter your dns to haproxy.cfg in configs/configMap.yaml.

### Running

If you are going to run it for the first time, you must run this shell script:

	chmod a+x ./init.sh

	chmod a+x ./start.sh

	chmod a+x ./stop.sh

	./init.sh

If you run init.sh once then run this shell script to run system:

	./start.sh

Run this shell script to delete pods:

	./stop.sh
