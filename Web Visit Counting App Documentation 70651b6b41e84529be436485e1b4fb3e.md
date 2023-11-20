# Web Visit Counting App Documentation

This documentation will walk you through the process of setting up a web visit counting app using Flask and Redis, packaged within a Docker container. The app will keep track of webpage visits and display the count to users.

# ****Files Structure****

/webvisit-app
├── [app.py](http://app.py/)
├── requirements.txt
├── Dockerfile
└── docker-compose.yml

### **Steps**

1. **Clone the Repository:**
    
    Clone the repository containing the app files to your local machine:
    
    [](https://github.com/Safeervs7/awesome-compose/blob/master/flask-redis/app.py)
    
    ### **Step 1: Getting Started**
    
    1. **Create a Project Directory**: Start by creating a directory for your project:
        
        ```
        
        mkdir webvisit-app
        cd webvisit-app
                                                                                                      
                                                                                                                          
        ```
        

        2.  **App Script**: Create a file named **`app.py`** and copy the following code into it:

from flask import Flask
from redis import Redis

app = Flask(**name**)
redis = Redis(host='redis', port=6379)

@app.route('/')
def hello():
redis.incr('hits')
counter = str(redis.get('hits'), 'utf-8')
return "This webpage has been viewed " + counter + " time(s)"

if **name** == "**main**":
app.run(host="0.0.0.0", port=8000, debug=True)

3 .**Requirements File**: Create a file named **`requirements.txt`** to list the dependencies:

flask
redis

### **Step 2: Docker Setup**

1. **Dockerfile**: Create a file named **`Dockerfile`** to specify how the Docker image will be built:
    
    ```
    DockerfileCopy code
    FROM python:3.6-buster
    
    WORKDIR /webvisit-app
    
    COPY requirements.txt .
    RUN pip install -r requirements.txt
    
    COPY . .
    
    CMD ["python", "app.py"]
    
    ```
    
2. **Docker Compose**: Create a file named **`docker-compose.yml`** to define the app's services and their configurations:
    
    ```yaml
    yamlCopy code
    version: '3.8'
    
    services:
      myapp:
        build:
          context: .
          dockerfile: Dockerfile
        image: myapp-image:latest
        ports:
          - "8000:8000"
        networks:
          - my_network
    
      redis:
        image: redis
        ports:
          - "6379:6379"
        networks:
          - my_network
    
    networks:
      my_network:
    
    ```
    

### **Step 3: Running the App**

1. **Building and Running**: Open a terminal and navigate to your project directory. Run the following command to build and run the app using Docker Compose:
    
    ```
    shCopy code
    docker-compose up --build
    
    ```
    
    This command will build the Docker image and start the app and Redis containers.
    
2. **Accessing the App**: Open your web browser and go to **`http://localhost:8000`** to see the webpage. Refresh the page a few times to increment the visit count.

### **Step 4: Stopping the App**

When you're done experimenting with the app, you can stop and remove the containers:

1. Press **`Ctrl+C`** in the terminal where you ran the **`docker-compose up`** command.
2. Run the following command to remove the containers:
    
    ```
    shCopy code
    docker-compose down
    
    ```
    

### **Conclusion**

Congratulations! You've successfully set up a web visit counting app using Flask, Redis, and Docker. This documentation provides a detailed guide to help you set up and run the app locally. You can now experiment with the app and explore further customization options to meet your specific needs.