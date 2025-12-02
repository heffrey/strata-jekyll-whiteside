#!/bin/bash

# Set up environment for crontab execution
export PATH="/root/gems/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games"
export HOME="/root"

# Set up Ruby gem environment (critical for cron execution)
export GEM_HOME="/root/gems"
export GEM_PATH="/root/gems:/root/.gem/ruby/2.5.0:/var/lib/gems/2.5.0:/usr/lib/x86_64-linux-gnu/rubygems-integration/2.5.0:/usr/share/rubygems-integration/2.5.0:/usr/share/rubygems-integration/all"

# Source bashrc to get any custom environment variables
source ~/.bashrc 2>/dev/null || true

# Ensure we're in the right directory
cd ~/Strata-Jekyll-Theme

# Log the current environment
echo "$(date): Starting deploy script" >> ~/deploy.log 2>&1
echo "$(date): PATH=$PATH" >> ~/deploy.log 2>&1
echo "$(date): GEM_HOME=$GEM_HOME" >> ~/deploy.log 2>&1
echo "$(date): GEM_PATH=$GEM_PATH" >> ~/deploy.log 2>&1
echo "$(date): PWD=$(pwd)" >> ~/deploy.log 2>&1

# Check if bundler is available and install if needed
if ! command -v bundle &> /dev/null; then
    echo "$(date): Bundler not found, installing..." >> ~/deploy.log 2>&1
    gem install bundler --user-install 2>&1 | tee -a ~/deploy.log
    export PATH="$HOME/.local/share/gem/ruby/2.5.0/bin:$PATH"
fi

echo "$(date): Bundle location: $(which bundle)" >> ~/deploy.log 2>&1

# Install dependencies if needed
if [ -f "Gemfile" ]; then
    echo "$(date): Installing dependencies..." >> ~/deploy.log 2>&1
    bundle install --path vendor/bundle 2>&1 | tee -a ~/deploy.log
fi

# Build the site with detailed output
echo "$(date): Building site with Jekyll..." >> ~/deploy.log 2>&1
bundle exec jekyll build 2>&1 | tee -a ~/deploy.log

# Check if build was successful
if [ $? -eq 0 ]; then
    echo "$(date): Jekyll build completed successfully" >> ~/deploy.log 2>&1
    
    # Copy files to web directory with explicit paths
    echo "$(date): Copying site files to /var/www/html..." >> ~/deploy.log 2>&1
    cp -r /root/Strata-Jekyll-Theme/_site/* /var/www/html/ 2>&1 | tee -a ~/deploy.log
    
    if [ $? -eq 0 ]; then
        echo "$(date): Site deployed successfully to /var/www/html" >> ~/deploy.log 2>&1
    else
        echo "$(date): Failed to copy files to /var/www/html" >> ~/deploy.log 2>&1
        exit 1
    fi
else
    echo "$(date): Jekyll build failed with exit code $?" >> ~/deploy.log 2>&1
    exit 1
fi
