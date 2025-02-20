# Dockerfile
FROM node:20-slim

# Create a non-root user
RUN groupadd -r jekyll && useradd -r -g jekyll jekyll

# Install dependencies for building native extensions
RUN apt-get update && apt-get install -y \
    build-essential \
    ruby \
    ruby-dev \
    git \
    && rm -rf /var/lib/apt/lists/*

# Install Jekyll and Bundler
RUN gem install jekyll bundler

# Set working directory
WORKDIR /app

# Copy package files
COPY package*.json ./
COPY Gemfile* ./

# Install dependencies
RUN npm install
RUN bundle install

# Copy the rest of the application
COPY . .

# Change ownership of the app directory to jekyll user
RUN chown -R jekyll:jekyll /app

# Switch to non-root user
USER jekyll

# Expose ports for Jekyll and BrowserSync
EXPOSE 4000 3000

# Start command will be defined in docker-compose.yml