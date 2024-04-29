# syntax = docker/dockerfile:1

# Make sure RUBY_VERSION matches the Ruby version in .ruby-version and Gemfile
ARG RUBY_VERSION=3.3.0
FROM registry.docker.com/library/ruby:$RUBY_VERSION-slim as base

# Rails app lives here
WORKDIR /rails

# Set production environment
ENV RAILS_ENV="production" \
    BUNDLE_DEPLOYMENT="1" \
    BUNDLE_PATH="/usr/local/bundle" \
    BUNDLE_WITHOUT="development:test"

# Install packages needed to build gems and runtime dependencies
RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y \
        build-essential \
        curl \
        git \
        libpq-dev \
        libsqlite3-0 \
        libvips \
        pkg-config \
        ruby-dev && \
    rm -rf /var/lib/apt/lists/* /var/cache/apt/archives/*

# Install application gems
COPY Gemfile Gemfile.lock ./
RUN bundle install --without development test && \
    bundle clean --force && \
    rm -rf ~/.bundle /tmp/* /var/tmp/*

# Copy application code
COPY . .

# Precompile assets and bootsnap (if this is a step you need)
RUN bundle exec bootsnap precompile --gemfile && \
    bundle exec rake assets:precompile

# Minimize image size by not including build dependencies in the final image
FROM ruby:$RUBY_VERSION-slim

WORKDIR /rails

# Install runtime dependencies only
RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y \
        libpq5 \
        libsqlite3-0 \
        libvips && \
    rm -rf /var/lib/apt/lists/* /var/cache/apt/archives/*

COPY --from=build /usr/local/bundle /usr/local/bundle
COPY --from=build /rails /rails

# Setup user for security
RUN useradd rails --create-home --shell /bin/bash && \
    chown -R rails:rails /rails

USER rails

# Entrypoint prepares the database.
ENTRYPOINT ["/rails/bin/docker-entrypoint"]

# Expose port 3000 and start the Rails server
EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]
