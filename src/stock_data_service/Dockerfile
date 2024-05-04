# syntax=docker/dockerfile:1

ARG RUBY_VERSION=3.3.0
FROM ruby:$RUBY_VERSION-slim as base

ENV RAILS_ENV=production \
    BUNDLE_PATH=/usr/local/bundle \
    BUNDLE_BIN=/usr/local/bundle/bin \
    GEM_HOME=/usr/local/bundle \
    PATH="/usr/local/bundle/bin:$PATH"

ENV SECRET_KEY_BASE=${SECRET_KEY_BASE}

WORKDIR /rails

RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y build-essential libpq-dev libvips libsqlite3-0

FROM base as builder

COPY Gemfile Gemfile.lock ./

RUN bundle install --without development test && \
    bundle clean --force

COPY . /rails

RUN bundle exec bootsnap precompile app/ lib/

FROM base as final

COPY --from=builder /usr/local/bundle /usr/local/bundle
COPY --from=builder /rails /rails

# Verify Rails is installed by checking the version
RUN rails --version

RUN useradd -m -s /bin/bash rails && chown -R rails:rails /rails
USER rails

ENTRYPOINT ["/rails/bin/docker-entrypoint"]
EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]
