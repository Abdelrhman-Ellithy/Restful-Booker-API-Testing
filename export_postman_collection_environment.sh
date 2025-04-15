#!/bin/bash
set -euo pipefail

#-------------------------------------------------------------------
# Function: download_resource
# Description: Downloads a Postman resource (collection or environment)
# Parameters:
#   $1 - resource type ("collections" or "environments")
#   $2 - resource ID
#   $3 - output filename
#   $4 - display name for echo messages
#-------------------------------------------------------------------
download_resource() {
  local resource_type="$1"   # collections or environments
  local resource_id="$2"
  local output_file="$3"
  local display_name="$4"

  echo "Exporting ${display_name}..."
  curl -s -X GET "https://api.getpostman.com/${resource_type}/${resource_id}" \
       -H "X-Api-Key: ${POSTMAN_API_KEY}" -o "${output_file}"
  if [ $? -eq 0 ]; then
    echo "${display_name} exported successfully to ${output_file}"
  else
    echo "Failed to export ${display_name}"
    exit 1
  fi
}

#-------------------------------------------------------------------
# Function: copy_artifact
# Description: Copies a file to a given destination directory,
#              creating the directory if it doesn’t exist.
# Parameters:
#   $1 - file to copy
#   $2 - destination directory
#-------------------------------------------------------------------
copy_artifact() {
  local file="$1"
  local dest_dir="$2"
  mkdir -p "${dest_dir}"
  cp "${file}" "${dest_dir}"
}

########################## START ###############################

download_resource "collections" "${CollectionID}" "${COLLECTION_NAME}" "Postman Collection"
download_resource "environments" "${ENVIRONEMENTID}" "${ENVIRONMENT_NAME}" "Postman Environment"

copy_artifact "${COLLECTION_NAME}" "artifacts/"
copy_artifact "${ENVIRONMENT_NAME}" "artifacts/"

ls -l artifacts/
pwda
########################### END ################################