#!/bin/bash

# Check if profile and region are provided as arguments
if [ $# -ne 2 ]; then
  echo "Usage: $0 <AWS_PROFILE> <AWS_REGION>"
  exit 1
fi

# Read the profile and region from arguments
AWS_PROFILE=$1
AWS_REGION=$2

# Step 1: Identify the bucket created by CDKToolkit
BUCKET_NAME=$(aws cloudformation describe-stack-resources \
  --profile $AWS_PROFILE \
  --region $AWS_REGION \
  --stack-name CDKToolkit \
  --query "StackResources[?ResourceType=='AWS::S3::Bucket'].PhysicalResourceId" \
  --output text)

if [ -z "$BUCKET_NAME" ]; then
  echo "No bucket found for CDKToolkit stack. Exiting."
  exit 1
fi

# Step 2: Empty the bucket
echo "Emptying bucket: $BUCKET_NAME"
aws s3 rm s3://$BUCKET_NAME --recursive --profile $AWS_PROFILE --region $AWS_REGION

# Step 3: Delete the stack
echo "Deleting CDKToolkit stack..."
aws cloudformation delete-stack --stack-name CDKToolkit --profile $AWS_PROFILE --region $AWS_REGION

# Step 4: Wait for stack deletion to complete
echo "Waiting for stack to be deleted..."
aws cloudformation wait stack-delete-complete --stack-name CDKToolkit --profile $AWS_PROFILE --region $AWS_REGION

echo "CDKToolkit stack deleted successfully!"

# Step 5: Delete the bucket
echo "Deleting bucket: $BUCKET_NAME"
aws s3api delete-bucket --bucket $BUCKET_NAME --profile $AWS_PROFILE --region $AWS_REGION
