docker build -t xumes/fibo-client:latest -t xumes/fibo-client:$SHA -f ./client/Dockerfile ./client
docker build -t xumes/fibo-server:latest -t xumes/fibo-server:$SHA -f ./server/Dockerfile ./server
docker build -t xumes/fibo-worker:latest -t xumes/fibo-worker:$SHA -f ./worker/Dockerfile ./worker

docker push xumes/fibo-client:latest
docker push xumes/fibo-server:latest
docker push xumes/fibo-worker:latest
docker push xumes/fibo-client:$SHA
docker push xumes/fibo-server:$SHA
docker push xumes/fibo-worker:$SHA

kubectl apply -f k8s
kubectl set image deployments/server-deployment server=xumes/fibo-server:$SHA
kubectl set image deployments/client-deployment client=xumes/fibo-client:$SHA
kubectl set image deployments/worker-deployment worker=xumes/fibo-worker:$SHA
