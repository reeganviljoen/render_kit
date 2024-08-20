# frozen string literal: true

require "active_support/concern"

module RenderKit
  module ImplicitRenderMonkeyPatch
    def default_render
      if renderable = find_renderable(action_name.to_s, _prefixes)
        render(renderable.new)
      else
        super
      end
    end

    def find_renderable(action_name, prefixes)
      RenderKit::RenderableRegistry.get_renderables([prefixes, action_name].join("_"), controller=true)
    end
  end
end
