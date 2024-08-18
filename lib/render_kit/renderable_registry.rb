# frozen_string_literal: true

module RenderKit
  module RenderableRegistry # :nodoc:
    @renderables = Hash.new {}

    def self.get_renderables(path)
      @renderables[path]
    end

    def self.set_renderable(path, renderable_klass)
      @renderables[path] = renderable_klass
    end
  end
end
