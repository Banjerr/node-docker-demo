# Gonna start with a minimal Linux distro called Alpine with node installed
FROM mhart/alpine-node:latest

# Create app directory
## Here we are creating the directory "/usr/src/app"
## And then sets the WORKDIR to that directory
# Which sets the desired directory for RUN, CMD, ENTRYPOINT, COPY and ADD instructions that follow it in the Dockerfile
RUN mkdir -p /usr/src/app && mkdir -p /usr/src/data/db
WORKDIR /usr/src/app

# Install app dependencies
## Here we copy the package.json containing dependencies
# And then we use the NPM binary to install all the things
COPY package.json /usr/src/app/
RUN npm install && npm cache clean

# Bundle app source
## Here we're just copying over the code for the app
# Yep
COPY . /usr/src/app

# Expose the right port
## The EXPOSE instruction tells Docker which port to map for the app
EXPOSE 8080

# Finally, the instruction which tells Docker it's time to start the show
## Here we're just using `npm start`, which will run `node server.js`
CMD [ "npm", "start" ]
