FROM debian

RUN echo 'deb http://ftp.jp.debian.org/debian/ jessie main contrib non-free' > /etc/apt/sources.list

RUN apt-get update && apt-get -y upgrade \
&& apt-get -y install ruby sqlite \
ruby-dev zlib1g-dev libsqlite3-dev \
gcc make patch g++ \
git vim \
&& apt-get clean

RUN echo "install: --no-document\nupdate: --no-document" >> /etc/gemrc

RUN gem update --system
RUN gem install rails

RUN rails new project
RUN sed -ri "s/^# gem 'therubyracer'(.*)/gem 'therubyracer', platforms: :ruby/g" /project/Gemfile

WORKDIR /project
RUN bundle install
ENTRYPOINT ["rails"]
CMD ["s", "-b", "0.0.0.0", "-e", "development"]
