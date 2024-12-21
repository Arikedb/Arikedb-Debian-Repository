# Welcome to Arikedb debian repositort

## How to use this repository

### Add the repository

To add the repository execute the following commands in your terminal:

```bash
curl -s --compressed "https://arikedb.github.io/Arikedb-Debian-Repository/KEY.gpg" | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/arikedb.gpg > /dev/null
```

```bash
ARCH=$(dpkg --print-architecture) curl -s https://arikedb.github.io/Arikedb-Debian-Repository/arikedb.list | sed "s/SYS_ARCH/$ARCH/" | sudo tee /etc/apt/sources.list.d/arikedb.list
```

### Update packages list

```bash
sudo apt update
```

### Install packages

```bash
sudo apt install arikedb
```
