# Welcome to Arikedb debian repositort

## How to use this repository

### Add the repository

To add the repository execute the following commands in your terminal:

```bash
echo "deb [trusted=yes] https://arikedb.github.io/debian/ stable main" | sudo tee /etc/apt/sources.list.d/arikedb.list
```
### Update packages list

```bash
sudo apt update
```

### Install packages

```bash
sudo apt install arikedb
```
