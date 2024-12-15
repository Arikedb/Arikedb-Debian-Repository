# Welcome to Arikedb debian repositort

## How to use this repository

### Add the repository

To add the repository execute the following commands in your terminal:

```bash
curl -s --compressed "https://arikedb.github.io/Arikedb-Debian-Repository/debian/KEY.gpg" | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/arikedb.gpg > /dev/null
```

```bash
sudo curl -s --compressed -o /etc/apt/sources.list.d/arikedb.list "https://arikedb.github.io/Arikedb-Debian-Repository/debian/arikedb.list"
```

### Update packages list

```bash
sudo apt update
```

### Install packages

```bash
sudo apt install arikedb
```
