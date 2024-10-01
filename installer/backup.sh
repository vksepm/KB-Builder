#!/bin/bash
# Setting Variables
DB_NAME="maxkb"  # Replace with your database name
BACKUP_DIR="/model/postgres/backup/$(date +%Y-%m-%d_%H-%M-%S)"  # backup directory
DB_USER="root"  # Database user
LOG_FILE="/model/postgres/backup/backup.log"  # Log file
PG_CTL_PATH="/usr/lib/postgresql/15/bin/pg_ctl"  # Replace with your actual path to pg_ctl
PG_PID_FILE="/var/lib/postgresql/data/postmaster.pid"  # Replace with your actual path 

# Create a backup directory
mkdir -p "$BACKUP_DIR"

# Get the PostgreSQL data storage location
DATA_DIR=$(psql -U "$DB_USER" -d "$DB_NAME" -c "SHOW data_directory;" | awk 'NR==3 {print $1}')
echo "PostgreSQL data directory: $DATA_DIR" | tee -a "$LOG_FILE"

# Check whether the data directory location is successfully obtained
if [ -z "$DATA_DIR" ]; then
    echo "Failed to get PostgreSQL data directory." | tee -a "$LOG_FILE"
    exit 1
fi

# Delete the backups older than 7 days
echo "Deleting backups older than 7 days from $BACKUP_DIR..." | tee -a "$LOG_FILE"
find /model/postgres/backup/* -type d -mtime +7 -exec rm -rf {} + 2>> "$LOG_FILE"

# Stop the PostgreSQL service
if [ -f "$PG_PID_FILE" ]; then
    PG_PID=$(head -n 1 "$PG_PID_FILE")
    echo "Stopping PostgreSQL service (PID: $PG_PID)..." | tee -a "$LOG_FILE"
    su - postgres -c "/usr/lib/postgresql/15/bin/pg_ctl -D /var/lib/postgresql/data stop"

    # Wait for PostgreSQL to stop
    sleep 5
    if [ -f "$PG_PID_FILE" ] || su - postgres -c "$PG_CTL_PATH -D $DATA_DIR status" | grep -q "server is running"; then
        echo "Failed to stop PostgreSQL service." | tee -a "$LOG_FILE"
        exit 1
    fi
else
    echo "PostgreSQL PID file not found." | tee -a "$LOG_FILE"
    exit 1
fi

# Backup data directory
echo "Backing up data directory from $DATA_DIR to $BACKUP_DIR..." | tee -a "$LOG_FILE"
cp -r "$DATA_DIR" "$BACKUP_DIR"

# Check if the backup was successful
if [ $? -eq 0 ]; then
    echo "Backup completed successfully." | tee -a "$LOG_FILE"
else
    echo "Backup failed." | tee -a "$LOG_FILE"
    exit 1
fi

# Start the PostgreSQL service
echo "Starting PostgreSQL service..." | tee -a "$LOG_FILE"
su - postgres -c "$PG_CTL_PATH -D $DATA_DIR start"

# Check if the PostgreSQL service is started
if ! su - postgres -c "$PG_CTL_PATH -D $DATA_DIR status" | grep -q "server is running"; then
    echo "Failed to start PostgreSQL service." | tee -a "$LOG_FILE"
    exit 1
fi

echo "PostgreSQL service started successfully." | tee -a "$LOG_FILE"
