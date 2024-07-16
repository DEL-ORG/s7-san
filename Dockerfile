# Use Ubuntu as the base image
FROM ubuntu:latest

# Set the working directory to /app
WORKDIR /app

# Install python3 and python3-pip
RUN apt-get update && apt-get install -y python3 python3-pip

# Copy the requirements.txt file into the container
COPY requirements.txt /app/

# Install any needed packages specified in requirements.txt
RUN pip3 install -r requirements.txt

# Copy the current directory contents into the container at /app
COPY . /app

# Make port 8000 available to the world outside this container
EXPOSE 8000

# Define the command to run the application
ENTRYPOINT ["python3"]
CMD ["manage.py", "runserver", "0.0.0.0:8000"]

