## Create file
```
cp ./installer/Dockerfile ./
docker build -t kbbuilder:v1 .
```
```sh
./build_docker_image.sh maxkb linux/amd64 v1.1.0-dev
```

docker run -d --name kb_builder -p 8080:8088 -v ~/.kb-builder:/var/lib/postgresql/data hduchat/bindian.hdu.edu.cn

docker buildx build --output type=image --platform linux/amd64 --build-arg DOCKER_IMAGE_TAG=v1.1.0-dev --build-arg BUILD_AT=2024-10-01T03:40 --build-arg GITHUB_COMMIT=eddb121 --no-cache --tag maxkb:v1.1.0-dev -f installer/Dockerfile
docker buildx build --output type=image --platform linux/amd64 --build-arg DOCKER_IMAGE_TAG=v1.1.0-dev --build-arg BUILD_AT=2024-10-01T03:40 --build-arg GITHUB_COMMIT=eddb121 --no-cache --tag maxkb:v1.1.0-dev -f installer/Dockerfile .
