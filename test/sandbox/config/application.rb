# require "rails/all"

require File.expand_path("boot", __dir__)

require "active_model/railtie"
require "action_controller/railtie"
require "action_view/railtie"

require "render_kit"
require "view_component"

module Sandbox
  class Application < Rails::Application
  end
end
