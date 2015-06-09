FROM debian:jessie

RUN apt-get update && \
    apt-get --no-install-recommends -y install curl unzip libwww-perl libdatetime-perl && \
    curl -L -s -o /tmp/cwms.zip http://aws-cloudwatch.s3.amazonaws.com/downloads/CloudWatchMonitoringScripts-1.2.1.zip && \
    unzip -d /usr/local /tmp/cwms.zip && rm /tmp/cwms.zip

ENTRYPOINT ["/usr/local/aws-scripts-mon/mon-put-instance-data.pl"]
