kubectl cluster-info > /dev/null 2>&1
if [ $? -eq 0 ]; then
	kubectl create -f kube.yaml
	kubectl create -f postgres.yaml
else
	echo "Kubernetes cluster not found. Starting failed."
fi