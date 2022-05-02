# Get the node alpine image from dockerhub
FROM node:16-alpine as builder
# Make a work dir inside docker, same as "cd" command
WORKDIR /frontend
# Copy the package and package-lock files from current dir (respective to "Dockerfile") to the workdir
# we could have written as "." instead of "/frontend" below as we have set workdir as "/frontend"
COPY ./package*.json /frontend
# Install all the dependencies
RUN npm install
# Copy all the files from current dir to the work dir
COPY . .
# Build react 
RUN npm run build
# get the nginx alpine image from dockerhub
FROM nginx:1.21.6-alpine
# Make workdir as the following for nginx
WORKDIR /usr/share/nginx/html
# Remove all the things in the work dir before copying
RUN rm -rf ./*
# Copy the build from builder(line #2 above, defined as alias)
COPY --from=builder /frontend/build .
# expose the port inside the docker, so that it will be accessible from outside
EXPOSE 3000
# Command to run nginx
CMD ["nginx", "-g", "daemon off;"]