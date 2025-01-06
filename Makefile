mariadb-debug:
	@docker build -t mariadb-debug ./srcs/requirements/mariadb
	@docker run -d --name mariadb-debug-container mariadb-debug
	@echo "Waiting for MariaDB to initialize..."
	@sleep 5
	@docker exec -it mariadb-debug-container sh

nginx-debug:
	@docker build -t nginx-debug ./srcs/requirements/nginx
	@docker run -dp 443:443 --name nginx-debug-container nginx-debug
	@sleep 2
	@docker exec -it nginx-debug-container sh

stop-mariadb-debug:
	@docker stop mariadb-debug-container || true
	@docker rm mariadb-debug-container || true

stop-nginx-debug:
	@docker stop nginx-debug-container || true
	@docker rm nginx-debug-container || true

force-clean:
	@docker rm -f $$(docker ps -aq) || true
	@docker rmi -f $$(docker images -q) || true

# utilities

list-containers:
	@docker ps -a

list-images:
	@docker images