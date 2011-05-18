require 'pathname'

module Flynn
  class Config
    def build
      recipes_directory.mkpath # will make the .flynn directory as well
      config_file.open('w').close # is there an easier way
      self
    end

    def flynn_directory
      @flynn_directory ||= Pathname.new("#{ENV["HOME"]}/.flynn")
    end

    def config_file
      @config_file ||= flynn_directory + 'config.yml'
    end

    def recipes_directory
      @recipes_directory ||= flynn_directory + 'recipes'
    end
  end
end