FROM rabbitmq:3.8-management
RUN rabbitmq-plugins enable --offline rabbitmq_stomp 
RUN rabbitmq-plugins enable --offline rabbitmq_web_stomp

#Rabbit Custom Configuration
COPY rabbitmq.conf /etc/rabbitmq/rabbitmq.conf
COPY definitions.json /etc/rabbitmq/definitions.json
COPY ./CA/ca_certificate.pem /rabbit/stomp/ssl/ca_certificate.pem
COPY ./Server/server_certificate.pem /rabbit/stomp/ssl/server_certificate.pem
COPY ./Server/server_key.pem /rabbit/stomp/ssl/server_key.pem

RUN chmod -R 777 /rabbit/stomp/ssl