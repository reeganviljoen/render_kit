# frozen_string_literal: true

require "render_kit/version"
require "active_support/dependencies/autoload"
require "render_kit/engine"
module RenderKit
  extend ActiveSupport::Autoload

  autoload :RenderableRegistry
end
