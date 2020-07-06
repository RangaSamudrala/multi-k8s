docker build -t rsamudrala/multi-client:latest -t rsamudrala/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t rsamudrala/multi-server:latest rsamudrala/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t rsamudrala/multi-worker:latest rsamudrala/multi-worker:$SHA -f ./worker/Dockerfile ./worker
docker push rsamudrala/multi-client:latest
docker push rsamudrala/multi-server:latest
docker push rsamudrala/multi-worker:latest
docker push rsamudrala/multi-client:$SHA
docker push rsamudrala/multi-server:$SHA
docker push rsamudrala/multi-worker:$SHA
kubectl apply -f k8s
kubectl set image deployments/server-deployment server=rsamudrala/multi-server:$SHA
kubectl set image deployments/client-deployment client=rsamudrala/multi-client:$SHA
kubectl set image deployments/worker-deployment worker=rsamudrala/multi-worker:$SHA
