$:.push File.expand_path("../lib", __FILE__)
require 'cover_me'
require "flynn"

RSpec.configure do |config|
  # config.after(:suite) do
  #   CoverMe.complete!
  # end
end
