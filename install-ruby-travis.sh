# docker pull ruby:alpine3.11
# Configure a volume to store service account JSON file in that folder
docker run -it -v $(pwd):/app ruby:alpine3.11 sh


