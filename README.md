Web Visit Counting App Using Docker Compose
Overview
This repository contains a web visit counting application built with a simple web server and a database, orchestrated using Docker Compose. The application tracks the number of visits to a webpage and displays the count to users. It is designed to demonstrate the use of Docker Compose for multi-container applications, combining a web application and a database service.
Features

Tracks and displays the number of visits to the webpage.
Uses Docker Compose to manage a web server and a database.
Simple and lightweight implementation for learning purposes.
Scalable architecture with containerized services.

Prerequisites
To run this application, ensure you have the following installed:

Docker
Docker Compose

Getting Started
Follow these steps to set up and run the application locally:
1. Clone the Repository
git clone https://github.com/shefeekar/web-visit-counting-app-using-dockercompose.git
cd web-visit-counting-app-using-dockercompose

2. Configure the Application
Ensure the docker-compose.yml file is present in the root directory. The file defines the services for the web application and the database. A sample configuration might look like this:
version: '3'
services:
  web:
    build: .
    ports:
      - "8080:8080"
    depends_on:
      - db
  db:
    image: redis:latest
    volumes:
      - redis-data:/data
volumes:
  redis-data:

3. Build and Run the Application
Run the following command to build and start the containers:
docker-compose up --build

This command will:

Build the web application container from the Dockerfile.
Start the Redis database container.
Map port 8080 on your local machine to the web application's port.

4. Access the Application
Open your browser and navigate to:
http://localhost:8080

You should see the webpage displaying the visit count, which increments with each page refresh.
5. Stopping the Application
To stop the application, press Ctrl+C in the terminal where docker-compose is running, or use:
docker-compose down

This will stop and remove the containers while preserving the Redis data volume.
Project Structure
web-visit-counting-app-using-dockercompose/
├── Dockerfile
├── docker-compose.yml
├── app/
│   ├── main.py (or relevant application code)
│   └── requirements.txt
└── README.md


Dockerfile: Defines the web application container.
docker-compose.yml: Configures the multi-container setup with the web app and Redis database.
app/: Contains the application code (e.g., a Python web server using Flask or similar).
requirements.txt: Lists the dependencies for the web application.

Example Application Code
The application might use a simple Flask server with Redis to store the visit count. Below is an example of what the main.py might look like:
from flask import Flask
from redis import Redis

app = Flask(__name__)
redis = Redis(host='db', port=6379)

@app.route('/')
def home():
    count = redis.incr('visits')
    return f'This page has been visited {count} times!'

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080)

Troubleshooting

Port Conflict: If port 8080 is in use, update the docker-compose.yml to map a different host port (e.g., 8081:8080).
Redis Connection Issues: Ensure the db service name matches the hostname in your application code.
Build Errors: Verify that the Dockerfile and requirements.txt are correctly configured.

Contributing
Contributions are welcome! Please fork the repository and submit a pull request with your changes. Ensure your code follows the existing style and includes appropriate tests.
License
This project is licensed under the MIT License. See the LICENSE file for details.
