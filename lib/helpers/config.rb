# noinspection RubyResolve
class Helpers::Config
  include Singleton
  attr_reader :env_config
  attr_reader :general_config

  class << self
    attr_accessor :project_root
  end

  def initialize
    @general_config = config_file_contents
    @env_config = @general_config[current_config]
  end

  def value_for(key_name)
    raise "There is no key #{key_name} is in the configuration you specified" if @env_config[key_name].nil?
    @env_config[key_name]
  end

  def self.[](key_name)
    instance.value_for(key_name)
  end

  def self.current_config
    instance.current_config
  end

  def current_config
    if ENV['CONFIG'].nil?
      default_config = @general_config['defaults']['default_config']
      default_config.nil? ? abort('No _CONFIG_ supplied and no _default_config_ found in the config.yml') : default_config
    else
      ENV['CONFIG']
    end
  end

  private
  def config_file_contents
    config_yaml = File.join(Dir.pwd, 'config/config.yml')
    raise 'The configuration file (config.yml) could not be found!' unless File.exists?(config_yaml)
    YAML::load(File.open(config_yaml))
  end
end