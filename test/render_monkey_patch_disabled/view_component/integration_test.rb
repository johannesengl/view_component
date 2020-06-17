# frozen_string_literal: true

require "test_helper"

class IntegrationTest < ActionDispatch::IntegrationTest
  if Rails.version.to_f < 6.1
    test "does not include render monkey patches if render_monkey_patch_enabled config is set to false" do
      assert(defined?(ViewComponent::RenderMonkeyPatch).nil?)
      assert(defined?(ViewComponent::RenderingMonkeyPatch).nil?)
      assert(defined?(ViewComponent::RenderToStringMonkeyPatch).nil?)
    end

    test "renders component using the render_component helper" do
      get "/render_component"
      assert_includes response.body, "bar"
    end
  end
end
