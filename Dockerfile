# obraz systemu, na podstawie którego tworzony jest niniejszy obraz
FROM alpine:latest

# katalog roboczy
WORKDIR /

# aktualizacja pakietów Alpine Linux oraz instalacja git i curl
RUN apk -U --no-cache upgrade \
    && apk add --no-cache git curl

# instalacja Minikube
RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" \
    && chmod +x ./kubectl \
	&& mv ./kubectl /usr/bin/kubectl