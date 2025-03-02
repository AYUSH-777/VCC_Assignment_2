#!/bin/bash

PROJECT_ID="VCC Assignment - 2”
ZONE="us-central1-a"
INSTANCE_NAME="iitj-vcc-assignment-2”

gcloud compute instances create $INSTANCE_NAME \
    --project=$PROJECT_ID \
    --zone=$ZONE \
    --machine-type=e2-micro \
    --image-family=debian-11 \
    --image-project=debian-cloud \
    --tags=http-server

gcloud compute firewall-rules create allow-http \
    --project=$PROJECT_ID \
    --allow=tcp:80 \
    --target-tags=http-server

SERVICE_ACCOUNT="550789157570-compute@${PROJECT_ID}.iam.gserviceaccount.com"
gcloud projects add-iam-policy-binding $PROJECT_ID \
    --member="serviceAccount:$SERVICE_ACCOUNT" \
    --role="roles/viewer"

echo "Basic GCP VM setup completed!"
