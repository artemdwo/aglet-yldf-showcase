class Helpers::Remote

  include Singleton
  attr_reader :env_config

  def initialize
    @env_config = config_file_contents
  end

  def value_for(key_name)
    raise "There is no key #{key_name} is in the configuration you specified" if @env_config[key_name].nil?
    @env_config[key_name]
  end

  def self.[](key_name)
    instance.value_for(key_name)
  end

  private
  def config_file_contents
    remote_yaml = File.join(Dir.pwd, 'config/remote.yml')
    raise 'The configuration file (remote.yml) could not be found!' unless File.exists?(remote_yaml)
    YAML::load(File.open(remote_yaml))
  end
end