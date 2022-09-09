APP = srv-tracing
STACK_CONF = docker-stack.yml
DOCKER_IMAGE = openzipkin/zipkin

# Swarm

docker-run:
	docker run -d -p 9411:9411 --rm --name ${APP} openzipkin/zipkin

stack-deploy:
	docker stack deploy -c ${STACK_CONF} ${APP}

stack-rm:
	docker stack rm ${APP}

service-logs:
	docker service logs ${APP}_web -f
