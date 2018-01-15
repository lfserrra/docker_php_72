FROM nginx:1.13.8-alpine

RUN apk add --update bash && rm -rf /var/cache/apk/*

ADD ./serve.sh /serve.sh

RUN chmod +x /serve.sh

RUN sed -i -e 's/\r$//' ./serve.sh