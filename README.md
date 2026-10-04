
# EC2 to S3 Automated Backup Project

## Project Overview

This project demonstrates automated backup of files from an AWS EC2 Linux server to Amazon S3 using AWS CLI and Bash scripting.

## AWS Services Used
=======
# AWS EC2 + S3 Secure Backup System

A hands-on AWS cloud project demonstrating how to deploy a Linux web server on Amazon EC2, integrate it with Amazon S3 using IAM roles, and automate web-server backups using AWS CLI, Bash, and Cron.

## Architecture

```text
                    AWS CLOUD

                    ┌──────────────┐
                    │    User      │
                    └──────┬───────┘
                           │ HTTP
                           ▼
                 ┌──────────────────┐
                 │   EC2 Instance   │
                 │  Amazon Linux    │
                 │  Apache HTTPD    │
                 └────────┬─────────┘
                          │
                    IAM Role
                          │
                          ▼
                 ┌──────────────────┐
                 │    Amazon S3     │
                 │                  │
                 │ Images           │
                 │ Backups          │
                 │ Documents        │
                 └──────────────────┘
```

## Technologies Used
>>>>>>> f8f71e3edfd5b629a89ff33420a446740b97a3df

- Amazon EC2
- Amazon S3
- AWS IAM
- AWS CLI
<<<<<<< HEAD

## Technologies

- Linux
- Bash Shell Scripting
- AWS CLI
- Amazon S3

## Project Structure

```text
ec2-s3-backup-project/
├── README.md
├── architecture/
├── scripts/
├── config/
├── screenshots/
└── .gitignore
=======
- Amazon Linux
- Apache HTTP Server
- Bash/Shell Scripting
- Cron
- Linux
- Security Groups

## Project Features

- Deployed an Apache web server on Amazon EC2.
- Configured HTTP and SSH access using Security Groups.
- Created an Amazon S3 bucket for cloud storage.
- Used an IAM role for secure EC2-to-S3 communication.
- Managed S3 objects using AWS CLI.
- Created a Bash script for automated web-server backups.
- Scheduled backups using Cron.
- Enabled S3 bucket versioning for object recovery.

## AWS Configuration

### EC2

The project uses an Amazon Linux EC2 instance running Apache HTTP Server.

Install Apache:

```bash
sudo dnf update -y
sudo dnf install httpd -y
sudo systemctl enable --now httpd
```

Check the service:

```bash
sudo systemctl status httpd
```

## S3

The S3 bucket contains:

```text
images/
backup/
documents/
```

S3 versioning is enabled to provide protection against accidental object changes or deletion.

## IAM

EC2 accesses S3 through an IAM role instead of storing AWS access keys on the server.

Example permissions include:

```text
s3:ListBucket
s3:GetObject
s3:PutObject
s3:DeleteObject
```

Permissions are restricted to the project bucket.

## AWS CLI Commands

Check AWS identity:

```bash
aws sts get-caller-identity
```

List S3 buckets:

```bash
aws s3 ls
```

List project bucket:

```bash
aws s3 ls s3://YOUR-BUCKET-NAME
```

Upload an object:

```bash
aws s3 cp file.txt s3://YOUR-BUCKET-NAME/
```

Download an object:

```bash
aws s3 cp s3://YOUR-BUCKET-NAME/file.txt .
```

Synchronize a directory:

```bash
aws s3 sync project-data/ s3://YOUR-BUCKET-NAME/backup/
```

## Automated Backup

The `backup.sh` script copies the Apache web-server files and uploads them to Amazon S3.

Example:

```bash
#!/bin/bash

SOURCE="/var/www/html"
BUCKET="s3://YOUR-BUCKET-NAME/backup"

DATE=$(date +"%Y-%m-%d-%H-%M-%S")
BACKUP_DIR="/tmp/web-backup-$DATE"

mkdir -p "$BACKUP_DIR"

cp -r "$SOURCE"/* "$BACKUP_DIR"/

aws s3 sync "$BACKUP_DIR" "$BUCKET/$DATE/"

if [ $? -eq 0 ]; then
    echo "Backup successful: $DATE"
else
    echo "Backup failed: $DATE"
fi

rm -rf "$BACKUP_DIR"
```

Make the script executable:

```bash
chmod +x backup.sh
```

Run manually:

```bash
./backup.sh
```

## Scheduled Backup

Cron is used to automate backups.

Example daily schedule:

```text
0 2 * * * /home/ec2-user/backup.sh >> /home/ec2-user/backup.log 2>&1
```

This runs the backup every day at 2:00 AM.

## Security

The project follows these security practices:

- S3 bucket remains private.
- EC2 uses an IAM role instead of hardcoded AWS credentials.
- SSH access is restricted to the administrator's IP.
- HTTP is exposed for the web application.
- S3 permissions are restricted to the required bucket.
- AWS access keys and secret keys are never stored in the repository.

## Screenshots

### EC2 Instance

https://github.com/RushikeshTayare/ec2-s3-backup-project/blob/main/EC2%20Instances.png

### IAM Role

https://github.com/RushikeshTayare/ec2-s3-backup-project/blob/main/IAM%20%20Role.png

### S3 Bucket

https://github.com/RushikeshTayare/ec2-s3-backup-project/blob/main/s3%20Bucket.png

### AWS CLI

https://github.com/RushikeshTayare/ec2-s3-backup-project/blob/main/AWS%20cli.png

### Apache Web Server

![Apache](screenshots/05-apache.png)

### Web Application

![Website](screenshots/06-website.png)

### Backup Script

![Backup Script](screenshots/07-backup-script.png)

### S3 Backup

![S3 Backup](screenshots/08-s3-backup.png)

## Learning Outcomes

This project provided practical experience with:

- AWS EC2
- Amazon S3
- IAM roles and permissions
- AWS CLI
- Linux administration
- Apache web server
- Bash scripting
- Cron automation
- Cloud storage
- Backup automation
- AWS security fundamentals

## Future Improvements

- Add HTTPS using an Application Load Balancer.
- Add CloudWatch monitoring and alarms.
- Add Auto Scaling.
- Add S3 lifecycle policies.
- Add CI/CD deployment.
- Deploy the application using Infrastructure as Code.
e3edfd5b629a89ff33420a446740b97a3df
