# Specifies the base image for the Docker image which is using an official Node.js 16 Alpine Linux image. 
# Alpine Linux is a lightweight Linux distribution, making the resulting Docker image smaller in size.
FROM node:16-alpine

# Sets the working directory within the container to /app. 
# Subsequent command will be executed in this directory
WORKDIR /app

# Setting an environment variable 'PORT' with a value = 3000
# This variable can be access within the container, and the app inside the container can use it
ENV PORT=3000

# Copies the package.json & package-lock.json from the local directory to the /app directory in the container.
COPY ["package.json", "package-lock.json*", "./"]

# Runs the npm install command to install the Node.js application dependencies. 
# !! Run this command ONLY after copying the package JSON file to ensure that the dependencies will be installed correctly
RUN npm install

# Copies the entire local directory (containing your application code) to the /app directory in the container.
# This includes all application source code, configurations, and other files.
COPY . .

# Specifies the default command to run when the container starts. 
# In this case, it executes npm start to start the Node.js application.
CMD ["npm", "start"]