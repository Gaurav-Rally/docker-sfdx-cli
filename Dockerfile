# use small node image
FROM node:14.16.0-alpine3.10

# install git ca-certificates openssl openssh for CircleCI
# install jq for JSON parsing
RUN apk add --update --no-cache git openssh ca-certificates openssl jq gettext xmlstarlet curl

# install latest sfdx from npm
RUN npm i -g sfdx-cli
RUN sfdx plugins:install sfdx-cli@7.89.2
RUN sfdx --version
RUN sfdx plugins --core

# revert to low privilege user
USER node