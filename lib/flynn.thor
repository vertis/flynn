class Flynn < Thor
  desc "create", "create a new application"
  def create(app_type, app_name)
    puts "Creating #{app_type}: #{app_name}"
  end
end