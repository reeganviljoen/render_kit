# frozen_string_literal: true

class TestImplicitControllerRenderComponent < ViewComponent::Base
  ActionView::Base.register_renderable("test_implicit_controller_render", TestImplicitControllerRenderComponent, controller_render=true)

  def initialize(title: nil)
    @title = title
  end
end
