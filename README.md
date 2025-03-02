# GCP Virtual Machine Setup, Auto-Scaling, and Security Configuration

## Introduction
This project demonstrates the setup of a Virtual Machine (VM) in Google Cloud Platform (GCP), implementing auto-scaling policies based on workload, and configuring security measures such as firewall rules and IAM roles.

## Objectives
- Deploy a VM instance in GCP.
- Configure auto-scaling to adjust resources dynamically.
- Implement firewall rules for security.
- Manage IAM roles for access control.

## Architecture Overview
The architecture includes:
1. **VM Instance Setup**: A compute instance provisioned on GCP.
2. **Auto-Scaling Instance Group**: Ensures dynamic scaling based on workload.
3. **Firewall Rules**: Restricts incoming and outgoing traffic based on predefined rules.
4. **IAM Roles**: Defines permissions for different users and service accounts.

## Prerequisites
- Google Cloud account with billing enabled.
- gcloud CLI installed and authenticated.
- Compute Engine API enabled.

## Deployment Steps
1. **Create a VM Instance:**
   ```sh
   gcloud compute instances create my-vm-instance \
     --machine-type=e2-medium \
     --image-family=debian-11 \
     --image-project=debian-cloud \
     --zone=us-central1-a
   ```

2. **Set Up an Auto-Scaling Instance Group:**
   ```sh
   gcloud compute instance-groups managed create my-instance-group \
     --base-instance-name=my-instance \
     --size=1 \
     --template=my-instance-template \
     --zone=us-central1-a \
     --target-size=3
   ```

3. **Configure Firewall Rules:**
   ```sh
   gcloud compute firewall-rules create allow-http \
     --allow=tcp:80 \
     --source-ranges=0.0.0.0/0 \
     --target-tags=http-server
   ```

4. **Assign IAM Roles:**
   ```sh
   gcloud projects add-iam-policy-binding my-project \
     --member="serviceAccount:550789157570-compute@developer.gserviceaccount.com" \
     --role="roles/editor"
   ```

## Conclusion
This setup provides a scalable, secure, and cost-effective solution for running virtual machines on GCP. Auto-scaling ensures optimal resource utilization, while IAM roles and firewall rules enhance security.

## Repository
Any deployment scripts or configurations used in this project can be found in this repository.
