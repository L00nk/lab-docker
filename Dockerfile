# syntax=docker/dockerfile:experimental
FROM node:alpine

# change working directory
WORKDIR /usr/app

# install ssh client and git
RUN apk add --no-cache openssh-client git docker
# get the ssh key from github
RUN mkdir -p -m 0600 ~/.ssh && ssh-keyscan github.com >> ~/.ssh/known_hosts
# clone the repository
RUN --mount=type=ssh git clone git@github.com:L00nk/lab-docker.git .

# intall node package manager
RUN npm install
# run app (default image command)
CMD ["npm", "start"]