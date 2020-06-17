# frozen_string_literal: true
require "bundler/setup"
require "pp"
require "pathname"
require "minitest/autorun"

# Configure Rails Envinronment
ENV["RAILS_ENV"] = "test"

require File.expand_path("../config/environment.rb", __FILE__)
require "rails/test_help"

def with_preview_route(new_value)
  old_value = Rails.application.config.view_component.preview_route
  Rails.application.config.view_component.preview_route = new_value
  app.reloader.reload!
  yield
  Rails.application.config.view_component.preview_route = old_value
  app.reloader.reload!
end

def without_render_monkey_patch
  begin
    old_value = Rails.application.config.view_component.render_monkey_patch_enabled
    Rails.application.config.view_component.render_monkey_patch_enabled = false
    app.reloader.reload!
    yield
  ensure
    Rails.application.config.view_component.render_monkey_patch_enabled = old_value
    app.reloader.reload!
  end
end
