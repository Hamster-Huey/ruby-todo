FROM appsvctest/rubybase:2.3.3
RUN apt-get update -qq \
    && apt-get install -y nodejs unzip openssh-server dos2unix --no-install-recommends \
    && echo "root:Docker!" | chpasswd

RUN mkdir /app
WORKDIR /app
COPY . /app
RUN eval "$(rbenv init -)" ; rbenv global 2.3.3 ; bundle install
EXPOSE 3000
CMD eval "$(rbenv init -)" ; rbenv global 2.3.3 ; bundle install ; export SECRET_KEY_BASE=$(bundle exec rake secret) ; bundle exec rails s -e production -p 3000