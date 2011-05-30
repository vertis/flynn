module Flynn
  module Helpers
    def inside(dir)
      current_dir = Dir.pwd
      Dir.chdir(dir)
      yield
      Dir.chdir(current_dir)
    end
  end
end