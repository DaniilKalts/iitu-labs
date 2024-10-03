# 🐳 Setting Up pgAdmin with Docker

## ❗ Prerequisites

1. **Download Docker Desktop** for macOS and Windows users:  
   [Docker Desktop](https://www.docker.com/products/docker-desktop/)

2. **For Proud Arch Linux users**, install Docker and Docker Compose:
   ```bash
   sudo pacman -S docker docker-compose

3. Ensure Docker is properly installed and running before proceeding.

## 🚀 Step 1: Start the Project

1. Navigate to your project directory and start the Docker containers using:

```bash
docker-compose up
```

2. This will start the necessary services, including the Postgres database and pgAdmin.

## 🔍 Step 2: Accessing Postgres in pgAdmin

1. List all running containers to find the Postgres container ID:

```bash
docker ps
```

2. Retrieve the IP address of the Postgres container by inspecting it:

```bash
docker inspect CONTAINER_ID
```

- Replace CONTAINER_ID with the actual ID of your Postgres container.
- Copy the IPAddress from the JSON output.

3. Open pgAdmin and create a new server:

- Name the server (e.g., laboratory_work).
- Set the Host in the connection tab to the IP address you copied.
- Use the password defined in docker-compose.yml (e.g., root).

## 🛑 Step 3: Stopping and Cleaning Up (Optional)


1. Stop all running containers:

```bash
docker stop $(docker ps -q)
```

2. Remove all containers:
```bash
docker rm $(docker ps -a -q)
```

3. Remove all images:

```bash
docker rmi $(docker images -a -q)
```
