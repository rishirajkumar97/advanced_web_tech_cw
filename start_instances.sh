#!/bin/bash

gcloud auth activate-service-account github-actions@meta-geography-243114.iam.gserviceaccount.com --key-file=key.json --project=meta-geography-243114
# Assuming you have defined which services you're interested in
services=$(gcloud app services list --format="value(id)")

for service in $services; do
    echo "Starting all stopped versions in service $service"
    # List all non-serving versions of the service
    versions=$(gcloud app versions list --service="$service" --filter="SERVING_STATUS!=SERVING" --format="value(version.id)")
    for version in $versions; do
        echo "Starting version $version of service $service"
        gcloud app versions start $version
    done
done

gcloud auth revoke github-actions@meta-geography-243114.iam.gserviceaccount.com