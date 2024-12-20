!#/bin/bash

EMAIL="spt.arikedb@gmail"

# Packages & Packages.gz
dpkg-scanpackages --multiversion . > debian/Packages
gzip -k -f Packages

# Release, Release.gpg & InRelease
apt-ftparchive release . > Release
gpg --default-key "${EMAIL}" -abs -o - Release > debian/Release.gpg
gpg --default-key "${EMAIL}" --clearsign -o - Release > debian/InRelease

# Commit & push
git add -A
git commit -m update
git push
