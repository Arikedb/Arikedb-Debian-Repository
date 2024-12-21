#!/bin/bash

EMAIL="spt.arikedb@gmail"
DISTRIBUTION="stable"
COMPONENT="main"

# Create necessary directory structure
mkdir -p dists/${DISTRIBUTION}/${COMPONENT}/binary-amd64
mkdir -p dists/${DISTRIBUTION}/${COMPONENT}/binary-arm64

# Generate Packages and Packages.gz for amd64
dpkg-scanpackages --arch amd64 pool/${COMPONENT} > dists/${DISTRIBUTION}/${COMPONENT}/binary-amd64/Packages
gzip -k -f dists/${DISTRIBUTION}/${COMPONENT}/binary-amd64/Packages

# Generate Packages and Packages.gz for arm64
dpkg-scanpackages --arch arm64 pool/${COMPONENT} > dists/${DISTRIBUTION}/${COMPONENT}/binary-arm64/Packages
gzip -k -f dists/${DISTRIBUTION}/${COMPONENT}/binary-arm64/Packages

# Generate Release file
apt-ftparchive -c apt-ftparchive.conf release dists/${DISTRIBUTION} > dists/${DISTRIBUTION}/Release

# Generate Release.gpg and InRelease
rm -f dists/${DISTRIBUTION}/Release.gpg
rm -f dists/${DISTRIBUTION}/InRelease
gpg --default-key "${EMAIL}" -abs -o dists/${DISTRIBUTION}/Release.gpg dists/${DISTRIBUTION}/Release
gpg --default-key "${EMAIL}" --clearsign -o dists/${DISTRIBUTION}/InRelease dists/${DISTRIBUTION}/Release

# Commit and push changes to GitHub
git add -A
git commit -m "Update repository"
git push
