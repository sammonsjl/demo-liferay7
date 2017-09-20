FROM elasticsearch:2.4.0

ENV ELASTICSEARCH_SHARED=/storage/elasticsearch

RUN /usr/share/elasticsearch/bin/plugin install --batch analysis-icu \
    && /usr/share/elasticsearch/bin/plugin install --batch analysis-kuromoji \
    && /usr/share/elasticsearch/bin/plugin install --batch analysis-smartcn \
    && /usr/share/elasticsearch/bin/plugin install --batch analysis-stempel

ADD elasticsearch.yml /usr/share/elasticsearch/config/

COPY docker-entrypoint.sh /

RUN chmod +x /docker-entrypoint.sh

VOLUME /storage

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["elasticsearch"]