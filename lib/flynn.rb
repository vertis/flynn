require 'flynn/helpers'
require 'flynn/config'
require 'flynn/recipes'

module Flynn
  def self.config
    return @config unless @config.nil?
    @config = Flynn::Config.new
    @config.build
  end
end
