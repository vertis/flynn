module Flynn
  module Helpers
    def inside(dir)
      current_dir = Dir.pwd
      Dir.chdir(dir)
      yield
      Dir.chdir(current_dir)
    end

    def run(cmd)
      puts "Running: #{cmd}"
      system(cmd)
    end

    def create_file(name, content)
      throw Exception.new("File exists: #{name}") if File.exists?(name)
      File.open(name, 'w') { |f| f.write content }
      return true
    end

    def executable_path(cmd)
      ENV['PATH'].split(':').each do |folder|
        path = folder+'/'+cmd
        return path if File.exists?(path)
      end
      nil
    end
  end
end