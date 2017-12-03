#!/bin/bash

wget -q --tries=10 --timeout=20 --spider http://google.com
if [[ $? -eq 0 ]]; then
 
  # Record last backup time.
  TIMESTAMP=$(date +'On %F at %H:%I')
  echo $TIMESTAMP > ~/Documents/LAST_BACKED_UP.txt
  echo $TIMESTAMP > ~/projects/LAST_BACKED_UP.txt

  # Do the actual backups.

  aws s3 sync ~/Documents s3://hobbit-shire-backup/Documents --delete --storage-class=STANDARD_IA --profile=default
  aws s3 sync ~/projects s3://hobbit-shire-backup/projects --delete --storage-class=STANDARD_IA --profile=default
# else
#        echo "Offline"
fi
