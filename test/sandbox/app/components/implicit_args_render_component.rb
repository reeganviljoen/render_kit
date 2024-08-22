# frozen_string_literal: true

class ImplicitArgsRenderComponent < ViewComponent::Base
  ActionView::Base.register_renderable("implicit_args_render", ImplicitArgsRenderComponent)

  def initialize(title:)
    @title = title
  end
end
