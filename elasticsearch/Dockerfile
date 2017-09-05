FROM elasticsearch:2.4.0

RUN /usr/share/elasticsearch/bin/plugin install --batch analysis-icu \
    && /usr/share/elasticsearch/bin/plugin install --batch analysis-kuromoji \
    && /usr/share/elasticsearch/bin/plugin install --batch analysis-smartcn \
    && /usr/share/elasticsearch/bin/plugin install --batch analysis-stempel \
    && mkdir -p /mnt/shared/elasticsearch \
    && chown -R elasticsearch:elasticsearch /mnt/shared/elasticsearch

ADD elasticsearch.yml /usr/share/elasticsearch/config/