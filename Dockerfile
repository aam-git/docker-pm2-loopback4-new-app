FROM keymetrics/pm2:latest-slim
LABEL maintainer="AAMServices <info@aamservices.uk>"

WORKDIR /usr/src/app

RUN apt-get update && \
    apt-get install -y git && \ 
    curl -fsSL "https://raw.githubusercontent.com/aam-git/docker-pm2-loopback4-new-app/master/ecosystem.config.js" -o ecosystem.config.js && \
    npm i -g @loopback/cli && \
    cat config.json | lb4 app --config stdin

EXPOSE 3000

CMD [ "pm2-runtime", "start", "ecosystem.config.js" ]
