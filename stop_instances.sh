#!/bin/bash

gcloud auth activate-service-account github-actions@meta-geography-243114.iam.gserviceaccount.com --key-file=key.json --project=meta-geography-243114
# Loop through each service and stop all versions
echo "Stopping all versions in $service"
# List all versions of the service and stop each
versions=$(gcloud app instances list --filter="VM_STATUS=RUNNING" --format="value(version)")
for version in $versions; do
    echo "Stopping version $version"
    gcloud app versions stop $version
done

gcloud auth revoke github-actions@meta-geography-243114.iam.gserviceaccount.com