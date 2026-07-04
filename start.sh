#!/bin/sh
set -e

Orthanc /etc/orthanc/orthanc.json &
exec nginx -g 'daemon off;'
