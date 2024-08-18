# frozen_string_literal: true

require "rails/version"

require "bundler/setup"
require "pathname"
require "minitest/autorun"

# Configure Rails Environment
ENV["RAILS_ENV"] = "test"

require File.expand_path("sandbox/config/environment.rb", __dir__)
require "rails/test_help"
