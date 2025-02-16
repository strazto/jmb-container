FROM openjdk:11-jre-slim
ARG JMB_VERSION 0.4.3.4
ENV JMB_VERSION $JMB_VERSION

#No downloadable example config since 0.2.10
RUN mkdir -p /jmb/config
ADD https://github.com/jagrosh/MusicBot/releases/download/0.2.9/config.txt /jmb/config/config.txt


# Use SeVille's unofficial fork
# https://github.com/SeVile/MusicBot/releases/download/0.4.3.4/JMusicBot-0.4.3.4.jar
ADD https://github.com/SeVile/MusicBot/releases/download/$JMB_VERSION/JMusicBot-$JMB_VERSION.jar /jmb/JMusicBot.jar


COPY ./docker-entrypoint.sh /jmb

RUN chmod +x /jmb/docker-entrypoint.sh

VOLUME /jmb/config

ENTRYPOINT ["/jmb/docker-entrypoint.sh"]
