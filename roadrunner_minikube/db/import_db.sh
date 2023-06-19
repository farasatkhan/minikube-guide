#!/bin/bash

# Validate the command-line argument
if [ "$#" -ne 1 ]; then
  echo "Error: Please provide the MySQL pod name as a command-line argument."
  exit 1
fi

# Assign the command-line argument to the mysql_pod variable
mysql_pod=$1

# Copy the SQL file to the MySQL pod
kubectl cp roadrunner_db.sql "$mysql_pod":/tmp/roadrunner_db.sql

# Execute a shell inside the MySQL pod
kubectl exec -it "$mysql_pod" -- /bin/bash

# Connect to the MySQL server and import the SQL file
mysql -h 127.0.0.1 -P 3306 -u root -p roadrunner_db <<EOF
USE roadrunner_db;
source /tmp/roadrunner_db.sql;
EOF

# Exit the MySQL shell
exit