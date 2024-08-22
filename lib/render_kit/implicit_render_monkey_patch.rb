# frozen string literal: true

require "active_support/concern"

module RenderKit
  module ImplicitRenderMonkeyPatch
    def default_render
      if renderable = find_renderable(action_name.to_s, _prefixes)
        render(renderable.new(**renderable_params))
      else
        super
      end
    end

    def find_renderable(action_name, prefixes)
      RenderKit::RenderableRegistry.get_renderables([prefixes, action_name].join("_"), controller=true)
    end

    # unsafe_h is used to convert the params to a hash,
    # this is fine because the validtion is done in the renderable initializer
    def renderable_params
      params.to_unsafe_h.symbolize_keys.except(:controller, :action)
    end
  end
end
