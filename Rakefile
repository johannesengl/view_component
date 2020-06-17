# frozen_string_literal: true

require "bundler/gem_tasks"
require "rake/testtask"
require "simplecov"
require "simplecov-erb"

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

task :simple_cov do
  SimpleCov.start do
    formatter SimpleCov::Formatter::MultiFormatter.new([
      SimpleCov::Formatter::ERBFormatter,
      SimpleCov::Formatter::HTMLFormatter
])
  end

  SimpleCov.minimum_coverage 98 # TODO: Get to 100!
  SimpleCov.command_name "Unit Tests"
end

task :test do
  Rake::Task["simple_cov"].invoke
  Rake::Task["test_render_monkey_patch_enabled"].invoke
  Rake::Task["test_render_monkey_patch_disabled"].invoke
end

task default: :test
