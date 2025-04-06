FROM alpine:3.13.5

ENV SLEEPTIME=43200

RUN apk add --no-cache \
    perl \
	perl-http-cookies \
	perl-lwp-useragent-determined \
	perl-json \
	perl-json-xs \
	perl-lwp-protocol-https \
	perl-gd \
	dos2unix
								
WORKDIR /opt
								
COPY zap2xml.pl .
COPY entrypoint.sh .
								
# Fix line endings and permissions
RUN dos2unix entrypoint.sh && \
dos2unix zap2xml.pl && \
chmod +x entrypoint.sh && \
chmod +x zap2xml.pl

# Create volume for data
VOLUME /data

# Use shell form for entrypoint to avoid path issues
ENTRYPOINT /bin/sh /opt/entrypoint.sh
											
			  