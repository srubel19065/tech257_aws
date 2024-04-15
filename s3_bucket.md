# S3 Buckets
Azure = Blob Storage

AWS = S3 (Simple Storage Service)
- Advantages:
  - Limitless
  - Security: Private by default
  - Accessibility: Can be accessed anywhere with Internet, URL/endpoint provided
  - Redundancy: Built-in

## AWS CLI
### Python to install AWS CLI
1. python3 is already installed
2. `alias python=python3` - creates shortcut so we can use python as the command instead of python3
3. `sudo apt install python-pip` - installed pip (python package installer)
4. `sudo pip install awscli` - installs the AWS CLI
### Log into AWS account to use the CLI
1. `aws` - always at the beginning of each command
2. `aws configure` - authenticates the account with:
   1. access key
   2. secret key
   3. region
   4. format (json)

## CRUD = Create, Read, Update, Delete 
- Method used for S3
- `aws s3 ls` - shows s3 in the account
### Create S3
1. `aws s3 mb s3://<name of bucket>` = make bucket

### Read, Update s3 (Upload)
1. `aws s3 ls s3://<name>` = look whats in the bucket
2. `aws s3 cp <file> s3://<bucket>` = uploads file to the bucket

### Delete
1. `aws s3 rm s3://<bucket>/<file>` = deletes file from bucket
2. `aws s3 rm s3://<bucket> --recursive` = deletes bucket with everything inside
3. `aws cli s3 rm s3://<bucket>` = deletes bucket only if its empty
4. `aws cli s3://<bucket> --force` = force deletes the bucket with things inside


## Boto3
### List all buckets
`sudo nano list.sh`
``` 
import boto3

# Create an S3 client object
s3_client = boto3.client('s3')

# Get a list of all buckets
response = s3_client.list_buckets()

# Print the bucket names
for bucket in response.get('Buckets', []):
    print(bucket['Name'])

```

### Create a bucket

```
  GNU nano 6.2                     boto3-create.sh
import boto3

# Bucket name
bucket_name = "tech257-rubel-test-boto3"

# Create an S3 client object
s3_client = boto3.client('s3')

# Try creating the bucket with error handling and specify region as default region wont work
try:
  response = s3_client.create_bucket(Bucket=bucket_name, CreateBucketConfigurat>
  print(f"Bucket '{bucket_name}' created successfully!")
except Exception as e:
  print(f"Error creating bucket: {e}")

```

### Uploading a file using boto3
```
import boto3

# Bucket name (replace with your bucket name)
bucket_name = "tech257-rubel-test-boto3"

# File path (replace with the path to your file)
file_path = "/home/ubuntu/test.txt"

# Create an S3 client object
s3_client = boto3.client('s3')

# Upload the file to the bucket
try:
  s3_client.upload_file(file_path, bucket_name, file_path)
  print(f"File '{file_path}' uploaded to bucket '{bucket_name}' successfully!")
except Exception as e:
  print(f"Error uploading file: {e}")


```

### Delete file from bucket
```
import boto3

# Bucket name (replace with your bucket name)
bucket_name = "tech257-rubel-test-boto3"

# File name in S3 bucket (replace with the file name)
s3_file_name = "test.txt"

# Create an S3 client object
s3_client = boto3.client('s3')

# Delete the file from the bucket
try:
  s3_client.delete_object(Bucket=bucket_name, Key=s3_file_name)
  print(f"File '{s3_file_name}' deleted from bucket '{bucket_name}' successfully!")
except Exception as e:
  print(f"Error deleting file: {e}")

```

### Delete bucket
```
import boto3

# Bucket name (replace with the name of the bucket to delete)
bucket_name = "tech257-rubel-test-boto3"

# Create an S3 client object
s3_client = boto3.client('s3')

# Delete the bucket (ensure it's empty!)
try:
  # Check if bucket is empty first (recommended)
  response = s3_client.list_objects_v2(Bucket=bucket_name)
  if response.get('Contents', []):
      print(f"Bucket '{bucket_name}' is not empty. Please delete objects first!")
  else:
      s3_client.delete_bucket(Bucket=bucket_name)
      print(f"Bucket '{bucket_name}' deleted successfully!")
except Exception as e:
  print(f"Error deleting bucket: {e}")

```
