FROM alpine:latest

RUN deluser guest ; delgroup users
RUN addgroup -g 985 -S users
RUN adduser -S -G users -u 1000 -s /bin/sh -h /home/mudrii mudrii

# Terraform versioin https://releases.hashicorp.com/terraform/
ENV TERRAFORM_VERSION=0.11.9
ENV TERRAFORM_SHA256SUM=5d674e7b83945c37f7f14d0e4f655787dad86ba15b26e185604aa0c3812394ab

RUN apk --no-cache update && \
    apk --no-cache add \
    ca-certificates \
    curl && \
    curl https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip > terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    echo "${TERRAFORM_SHA256SUM}  terraform_${TERRAFORM_VERSION}_linux_amd64.zip" > terraform_${TERRAFORM_VERSION}_SHA256SUMS && \
    sha256sum -cs terraform_${TERRAFORM_VERSION}_SHA256SUMS && \
    unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /bin && \
    rm -f terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    apk --purge del curl 

USER mudrii
