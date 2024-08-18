# frozen string literal: true

require "active_support/concern"

module RenderKit
  module ViewPathsMonkeyPatch
    extend ActiveSupport::Concern

    module ClassMethods
      def register_renderable(path, renderable_klass)
        RenderKit::RenderableRegistry.set_renderable(path, renderable_klass)
      end
    end
  end
end