# frozen_string_literal: true

require "bundler/gem_tasks"
require "rake/testtask"

Rake::TestTask.new(:test_render_monkey_patch_enabled) do |t|
  t.libs << "test/render_monkey_patch_enabled"
  t.libs << "lib"
  t.test_files = FileList["test/render_monkey_patch_enabled/**/*_test.rb"]
end

Rake::TestTask.new(:test_render_monkey_patch_disabled) do |t|
  t.libs << "test/render_monkey_patch_disabled"
  t.libs << "lib"
  t.test_files = FileList["test/render_monkey_patch_disabled/**/*_test.rb"]
end

task :test do
  Rake::Task["test_render_monkey_patch_enabled"].invoke
  Rake::Task["test_render_monkey_patch_disabled"].invoke
end

task default: :test
