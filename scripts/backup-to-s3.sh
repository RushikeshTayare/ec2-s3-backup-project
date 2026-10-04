#!/bin/bash

SOURCE_DIR="/home/ec2-user/ec2-s3-backup/data"
BACKUP_DIR="/home/ec2-user/ec2-s3-backup/backup"
S3_BUCKET="rushikesh-ec2-s3-project-2026"
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")

BACKUP_FILE="$BACKUP_DIR/backup_$TIMESTAMP.tar.gz"

echo "Starting backup..."

tar -czf "$BACKUP_FILE" -C "$SOURCE_DIR" .

if [ $? -eq 0 ]; then
    echo "Backup created: $BACKUP_FILE"
else
    echo "Backup creation failed"
    exit 1
fi

aws s3 cp "$BACKUP_FILE" "s3://$S3_BUCKET/backups/$TIMESTAMP/"

if [ $? -eq 0 ]; then
    echo "Backup uploaded successfully to S3"
else
    echo "S3 upload failed"
    exit 1
fi

echo "Backup completed successfully."
