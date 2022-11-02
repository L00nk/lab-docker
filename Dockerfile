# syntax=docker/dockerfile:experimental
FROM alpine
# install ssh client and git
RUN apk add --no-cache openssh-client git docker
# get the ssh key from github
RUN mkdir -p -m 0600 ~/.ssh && ssh-keyscan github.com >> ~/.ssh/known_hosts
# clone the repository
RUN --mount=type=ssh git clone git@github.com:L00nk/lab-docker.git ~/lab-docker