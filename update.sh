#!/bin/bash

EMAIL="spt.arikedb@gmail"
DISTRIBUTION="stable"
COMPONENT="main"

# Create necessary directory structure
mkdir -p debian/dists/${DISTRIBUTION}/${COMPONENT}/binary-amd64
mkdir -p debian/dists/${DISTRIBUTION}/${COMPONENT}/binary-arm64

# Generate Packages and Packages.gz for amd64
dpkg-scanpackages --arch amd64 debian/pool/${COMPONENT} > debian/dists/${DISTRIBUTION}/${COMPONENT}/binary-amd64/Packages
gzip -k -f debian/dists/${DISTRIBUTION}/${COMPONENT}/binary-amd64/Packages

# Generate Packages and Packages.gz for arm64
dpkg-scanpackages --arch arm64 debian/pool/${COMPONENT} > debian/dists/${DISTRIBUTION}/${COMPONENT}/binary-arm64/Packages
gzip -k -f debian/dists/${DISTRIBUTION}/${COMPONENT}/binary-arm64/Packages

# Generate Release file
apt-ftparchive -c apt-ftparchive.conf release debian/dists/${DISTRIBUTION} > debian/dists/${DISTRIBUTION}/Release

# Generate Release.gpg and InRelease
gpg --default-key "${EMAIL}" -abs -o debian/dists/${DISTRIBUTION}/Release.gpg debian/dists/${DISTRIBUTION}/Release
gpg --default-key "${EMAIL}" --clearsign -o debian/dists/${DISTRIBUTION}/InRelease debian/dists/${DISTRIBUTION}/Release

# Commit and push changes to GitHub
git add -A
git commit -m "Update repository"
git push
