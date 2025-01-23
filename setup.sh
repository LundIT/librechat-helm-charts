#kubectl apply -f ./setup/mongo.yaml

#helm dependencies update ./charts/librechat

kubectl delete secret librechat-credentials-env
kubectl create secret generic -n librechat librechat-credentials-env --from-env-file=.env

kubectl delete configmap librechat-config
kubectl create configmap librechat-config --from-file=librechat.yaml=librechat.yaml

helm uninstall librechat
sleep 5
helm install librechat ./charts/librechat