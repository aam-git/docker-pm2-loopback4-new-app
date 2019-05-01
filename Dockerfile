FROM keymetrics/pm2:latest-slim
LABEL maintainer="AAMServices <info@aamservices.uk>"

WORKDIR /usr/src/app

RUN apt-get update && \
    apt-get install -y git && \ 
    curl -fsSL "https://raw.githubusercontent.com/aam-git/docker-pm2-loopback4-hello-world/master/ecosystem.config.js" -o ecosystem.config.js && \
    npm i -g @loopback/cli && \
    lb4 app --applicationName application --outDir /usr/src/app/ --tslint --prettier --mocha --loopbackBuild

EXPOSE 3000

CMD [ "pm2-runtime", "start", "ecosystem.config.js" ]
