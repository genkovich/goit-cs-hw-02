#!/bin/bash

sites=(
  "https://google.com"
  "https://facebook.com"
  "https://twitter.com"
)

logfile="website_status.log"

> "$logfile"

check_site() {
  if curl -s --location --head "$1" | grep "200" > /dev/null; then
    echo "[$1]($1) is UP" >> "$logfile"
  else
    echo "[$1]($1) is DOWN" >> "$logfile"
  fi
}

for site in "${sites[@]}"; do
  check_site "$site"
done

echo "Results have been logged to $logfile"