# frozen_string_literal: true

module RenderKit
  module RenderableRegistry # :nodoc:
    @renderables = Hash.new { |h, k| h[k] = {} }

    def self.get_renderables(path, controller=false)
      if controller
        renderable = @renderables[path]
        renderable[:renderable_klass] if renderable&.[](:controller_render)
      else
        @renderables[path][:renderable_klass]
      end
    end

    def self.set_renderable(path, renderable_klass, controller_render=false)
      @renderables[path] = {
        renderable_klass: renderable_klass,
        controller_render: controller_render
      }
    end
  end
end
