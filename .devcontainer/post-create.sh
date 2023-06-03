#!/bin/sh

# Install the version of Bundler.
if [ -f Gemfile.lock ] && grep "BUNDLED WITH" Gemfile.lock > /dev/null; then
    cat Gemfile.lock | tail -n 2 | grep -C2 "BUNDLED WITH" | tail -n 1 | xargs gem install bundler -v
fi

# If there's a Gemfile, then run `bundle install`
# It's assumed that the Gemfile will install Jekyll too
if [ -f Gemfile ]; then
    bundle install
fi

# Patch the jekyll watch notifier to exclude BROMIUM folders.
sudo sed -i 's/dir = Dir.new(path)/if path\.end_with\?\(\"\~BROMIUM\"\) then return end; dir = Dir.new(path)/' /usr/local/rvm/gems/default/gems/rb-inotify-0.10.1/lib/rb-inotify/notifier.rb
