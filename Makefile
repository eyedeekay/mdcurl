
dummy:

install:
	install local/bin/mdcurl /usr/local/bin
	install local/bin/mdcurl-wrapper /usr/local/bin

docker-build:
	docker build -t mdcurl .

docker-run:
	docker run -i --rm --name mdcurl-test -t mdcurl

docker-install:
	echo "docker run --env --name mdcurl -t mdcurl mdcurl"

