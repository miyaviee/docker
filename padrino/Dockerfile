FROM ruby

RUN ln -fs /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

ENV DATABASE_URL "db://postgres@postgres/postgres"

EXPOSE 3000

WORKDIR /app
CMD ["/sbin/init"]
