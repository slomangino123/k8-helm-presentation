#!/bin/bash -e

if [[ -z $1 ]]; then
    echo "Namespace not defined!"
    exit 1
fi

if [[ -z $2 ]]; then
    echo "Port not defined!"
    exit 1
fi

echo "Namespace: $1"
echo "Port: $2"

export NAMESPACE="$1"
export SERVICE_PORT="$2"

envsubst < values.template.yaml > values.$NAMESPACE.yaml

helm upgrade --install game-demo -n "$NAMESPACE" -f values.$NAMESPACE.yaml .