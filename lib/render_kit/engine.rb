# frozen_string_literal: true

require "rails"

require "render_kit/view_paths_monkey_patch"
require "render_kit/rendering_helper_monkey_patch"

module RenderKit
  class Engine < ::Rails::Engine # :nodoc:
    initializer "render_kit.action_view" do |app|
      ActiveSupport.on_load(:action_view) do
        ActionView::LookupContext.include RenderKit::ViewPathsMonkeyPatch
        ActionView::Base.include RenderKit::ViewPathsMonkeyPatch
        ActionView::Base.prepend RenderKit::RenderingHelperMonkeyPatch
      end
    end
  end
end
