require 'cucumber/rake/task'
require 'rspec/core/rake_task'
require 'yaml'
require 'selenium/rake/server_task'

desc 'CUKE Namespace'
namespace :cuke do
  profiles = YAML::load(File.open(File.join(Dir.pwd, 'config/cucumber.yml'))).keys
  profiles.each do |profile|
    Cucumber::Rake::Task.new(profile.to_sym) do |t|
      t.profile = profile
      t.libs << 'lib'
    end
  end

  Cucumber::Rake::Task.new('list_tags', 'List all tags') do |t|
    t.cucumber_opts = '-d -f Cucumber::Formatter::ListTags'
  end
end

desc 'CONFIG Namespace'
namespace :config do
  desc 'List available configurations'
  task :list do
    config_yaml = File.join(Dir.pwd, 'config/config.yml')
    raise 'The config yaml file could not be found' unless File.exists?(config_yaml)
    config_yaml_file = YAML::load(File.open(config_yaml))
    puts 'Known configurations are:'
    config_yaml_file.keys.each do |key|
      puts "  - #{key}"
    end
  end
end