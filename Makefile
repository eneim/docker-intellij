install:
	grep -q -F 'UID=' .env || echo "UID=$$(id -u)" >> .env
	grep -q -F 'GID=' .env || echo "GID=$$(id -g)" >> .env
	grep -q -F 'DISPLAY=' .env || echo "DISPLAY=$$DISPLAY" >> .env

build:
	 docker build -t gaelrottier/docker-intellij . --build-arg UID=$$(id -u) --build-arg GID=$$(id -g)	

upd:
	docker-compose up -d
up:
	docker-compose up

X11: up
	xhost +local:all
