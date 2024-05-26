

build:
	npm run build
	docker build -t arobson/mimidae:1.1.1 .

push: build
	docker push arobson/mimidae:1.1.1