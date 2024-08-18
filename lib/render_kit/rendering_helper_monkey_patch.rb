# frozen string literal: true

require "active_support/concern"

module RenderKit
  module RenderingHelperMonkeyPatch
    def render(options = {}, locals = {}, &)
      if renderable = RenderKit::RenderableRegistry.get_renderables(options)
        renderable.new(locals).render_in(self, &)
      else
        super
      end
    end
  end
end
