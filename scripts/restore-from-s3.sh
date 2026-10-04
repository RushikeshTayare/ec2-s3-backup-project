#!/bin/bash

S3_BUCKET="rushikesh-ec2-s3-project-2026"
RESTORE_DIR="/home/ec2-user/ec2-s3-backup/restore"

mkdir -p "$RESTORE_DIR"

echo "Available backups:"
aws s3 ls "s3://$S3_BUCKET/backups/" --recursive

echo "Enter S3 backup file path:"
read BACKUP_PATH

aws s3 cp "s3://$S3_BUCKET/$BACKUP_PATH" "$RESTORE_DIR/backup.tar.gz"

if [ $? -eq 0 ]; then
    echo "Backup downloaded successfully"
else
    echo "Backup download failed"
    exit 1
fi

mkdir -p "$RESTORE_DIR/extracted"

tar -xzf "$RESTORE_DIR/backup.tar.gz" -C "$RESTORE_DIR/extracted"

echo "Backup restored successfully."
echo "Restored files:"
ls -la "$RESTORE_DIR/extracted"
