# Stage 1: Build dependencies using node:14 as base image
FROM node:14 as dependencies

# Install Python 2 (required for some npm packages)
RUN apt-get update && apt-get install -y python2
RUN ln -s /usr/bin/python2 /usr/local/bin/python

# Copy package.json and install dependencies
COPY package.json .
RUN npm install

# Stage 2: Build the final image using node:14
FROM node:14

# Set metadata labels for Docker
LABEL org.label-schema.schema-version="1.0"
LABEL org.label-schema.docker.cmd="docker run -d -p 3000:3000 --name alpine_timeoff"

# Switch to root user to create a non-privileged user
USER root
RUN adduser --system app --home /app

# Switch back to non-privileged user
USER app

# Set the working directory inside the container
WORKDIR /app

# Copy application code from the build context to /app directory
COPY . /app

# Copy node_modules from the 'dependencies' stage
COPY --from=dependencies /node_modules ./node_modules

# Expose port 3000 to allow external access to the application
EXPOSE 3000

# Command to run the application when the container starts
CMD npm start
