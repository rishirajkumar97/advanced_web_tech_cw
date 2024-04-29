# syntax=docker/dockerfile:1

# Make sure RUBY_VERSION matches the Ruby version in .ruby-version and Gemfile
ARG RUBY_VERSION=3.3.0
FROM ruby:$RUBY_VERSION-slim as base

# Set Rails environment
ENV RAILS_ENV="production" \
    BUNDLE_DEPLOYMENT="1" \
    BUNDLE_PATH="/usr/local/bundle" \
    BUNDLE_WITHOUT="development:test"

# Set the working directory
WORKDIR /rails

# Install packages needed for runtime and build stages
RUN apt-get update -qq && apt-get install --no-install-recommends -y \
    build-essential \
    libpq-dev \
    libvips \
    libsqlite3-0

# Begin the build stage
FROM base as builder

# Install additional build-time dependencies
RUN apt-get update -qq && apt-get install -y git pkg-config ruby-dev

# Install Gems
COPY Gemfile Gemfile.lock ./
RUN bundle install --without development test && bundle clean --force

# Copy application code and precompile assets
COPY . /rails
RUN bundle exec bootsnap precompile --gemfile && bundle exec bootsnap precompile app/ lib/

# Final stage, setup for running the application
FROM base as final

# Set PATH to include directory where gem executables are located
ENV PATH="/usr/local/bundle/bin:$PATH"

# Copy gems from builder stage
COPY --from=builder /usr/local/bundle /usr/local/bundle
# Copy application code from builder stage
COPY --from=builder /rails /rails

# Check Rails installation
RUN rails --version

# Create and use a non-root user
RUN useradd rails --create-home --shell /bin/bash && chown -R rails:rails /rails
USER rails:rails

# Entrypoint and command to run the application
ENTRYPOINT ["/rails/bin/docker-entrypoint"]
EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]
