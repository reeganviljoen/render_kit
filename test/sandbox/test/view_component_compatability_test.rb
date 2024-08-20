# frozen_string_literal: true

require "test_helper"

class RenderKit::ViewComponentCompatibilityTest < ActionController::TestCase
  tests TestController

  # def setup
  #   # enable a logger so that (e.g.) the benchmarking stuff runs, so we can get
  #   # a more accurate simulation of what happens in "real life".
  #   super
  #   @controller.logger      = ActiveSupport::Logger.new(nil)
  #   ActionView::Base.logger = ActiveSupport::Logger.new(nil)

  #   @request.host = "www.nextangle.com"

  #   @old_view_paths = ActionController::Base.view_paths
  #   ActionController::Base.view_paths = File.join(FIXTURE_LOAD_PATH, "actionpack")
  # end

  # def teardown
  #   ActionView::Base.logger = nil

  #   ActionController::Base.view_paths = @old_view_paths
  # end

  def test_rendering_view_component
    get :component_implicit_render
    assert_response 200
    assert_response :success
    assert_match(/I have been implicity rendered/, @response.body)
  end

  def test_rendering_view_component_with_controller_render
    get :implicit_controller_render
    assert_response 200
    assert_response :success
    assert_match(/I have been implicity rendered by a controller/, @response.body)
  end
end
