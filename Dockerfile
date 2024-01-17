# set of instructions to tell Docker how to run the application

# specifies a base image 
# can make from scratch, but docker has built-in
# node is the base image - alpine is the version (see dockerhub for more options)
FROM node:alpine

# create this directory inside the containter
# all the code of our app will live in this directory (can be named whatever but this is best practice)
WORKDIR /usr/src/app

# copy everthing from app to working directory
# .(from, default root) .(to, default workdir)
COPY . . 

# install dependencies
RUN npm install

# what port to expose in the container
# same port as index.js file
EXPOSE 3000

# command to run after the container is built
CMD ["npm", "run", "start"]

# terminal commands to build then run the image with port mapping & bind mounts
# docker build -t <image-name> .
# docker run --name <container-name> -p 3000:3000 -v $(pwd):/usr/src/app <image-name>
# port mapping: 3000:3000 [local-port:container-port]
# bind mounts: specifiy directory in local machine for constant updates
