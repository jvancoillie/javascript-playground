build container :
docker build --pull --rm -f "Dockerfile" -t discovering-javascript:latest "."
launch node container :
docker run -it -v $(pwd):/usr/src/app discovering-javascript:latest /bin/bash