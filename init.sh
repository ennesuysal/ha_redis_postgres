auth=0
file_exists=0

if [ -f /mnt/pv-data/redis-sentinel/sentinel.conf ]; then
	file_exists=1
fi

if [ "$EUID" != 0 ]; then
	sudo -k
	if sudo true; then
		echo "OK!"
		if [ $file_exists -eq 0 ]; then
			sudo mkdir -pv /mnt/pv-data/redis-sentinel
			sudo cp -v configs/sentinel.conf /mnt/pv-data/redis-sentinel
		fi
		auth=1
	else
		echo "Wrong Password"
		exit
	fi
fi

if [ $auth -eq 0 ] && [ $file_exists -eq 0 ]; then
	mkdir -pv /mnt/pv-data/redis-sentinel
	cp -v configs/sentinel.conf /mnt/pv-data/redis-sentinel
fi

kubectl cluster-info > /dev/null 2>&1

if [ $? -eq 0 ]; then
	kubectl create -f configs/configMap.yaml
	kubectl create -f volumes/pv_db.yaml
	kubectl create -f volumes/pv_redis_sentinel.yaml
	kubectl create -f services/postgres_primary.yaml
	kubectl create -f services/postgres_replica.yaml
	kubectl create -f services/redis-master.yaml
	kubectl create -f services/redis-slave.yaml
else
	echo "Kubernetes cluster not found. Initialization failed."
fi
