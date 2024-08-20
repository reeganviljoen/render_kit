# frozen_string_literal: true

class ImplicitRenderComponent < ViewComponent::Base
  ActionView::Base.register_renderable("implicit_render", ImplicitRenderComponent)
end
