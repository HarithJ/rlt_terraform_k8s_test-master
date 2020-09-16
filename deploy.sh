#!/usr/bin/env bash
CLUSTER_NAME=""
CLUSTER_ZONE="us-central1-c"
GCP_PROJECT="waltlabs"

DOCKER_REGISTRY="gcr.io"
DOCKER_IMAGE_NAME="rlt-test"
DOCKER_TAG="$DOCKER_REGISTRY/$GCP_PROJECT/$DOCKER_IMAGE_NAME"

getClusterName() {
    cd terraform && \
        CLUSTER_NAME=$(cut -d "=" -f2 <<< $(terraform output)) && \
        cd ..
}

buildAndPushDockerImages() {
    cd application/rlt-test && \
        docker build . -t $DOCKER_TAG && \
        docker push $DOCKER_TAG && \
        cd ../..
}

createInfra() {
    pwd
    cd terraform && \
        terraform init && \
        terraform apply && \
        cd ..
}

setK8sContext() {
    gcloud container clusters get-credentials $CLUSTER_NAME \
        --zone $CLUSTER_ZONE --project $GCP_PROJECT
}

deployHelm() {
    helm install -f values.yaml rlt-test charts/rlt-test
}

deploy() {
    buildAndPushDockerImages

    createInfra

    getClusterName

    setK8sContext

    deployHelm
}

$1