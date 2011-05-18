require 'flynn/recipes'
require 'flynn/config'

module Flynn
  def self.config
    return @config unless @config.nil?
    @config = Flynn::Config.new
    @config.build
  end
end
