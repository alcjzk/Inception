inception:
	docker-compose -f srcs/docker-compose.yml up -d

cert:
	openssl req -x509 -newkey rsa:4096 -sha256 -nodes -days 365 -keyout certificate.key -out certificate.crt
