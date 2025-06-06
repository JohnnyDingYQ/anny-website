# in Docker, it is common to base a new image on a previously-created image
FROM python:3.12-slim

# Set the working directory in the image
WORKDIR .

# install dependencies into the image - doing this first will speed up subsequent builds, as Docker will cache this step
COPY Pipfile ./
COPY Pipfile.lock ./
RUN pip3 install pipenv
RUN pipenv install --system --deploy

# the ADD command is how you add files from your local machine into a Docker image
# Copy the current directory contents into the container at /app
ADD /app .

# expose the port that the Flask app is running on... by default 5000
EXPOSE 8000

# Run app.py when the container launches
CMD [ "gunicorn", "-w", "4", "--bind", "0.0.0.0:8000", "wsgi:app"]