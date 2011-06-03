require 'spec_helper'

describe Flynn::Helpers do
  before(:all) do
    class Subject
      include Flynn::Helpers
    end
  end
  subject { Subject.new }

  context "#inside" do
    it "I should be inside the directory specified while within the block" do
      subject.inside 'tmp' do
        Dir.pwd.should =~ /tmp$/
      end
    end
  end

  context "#executable_path" do
    it "should return the path to the executable if it exists within $PATH" do
      subject.executable_path('bash').should =~ /bash$/
    end

    it "should return nil if the executable doesn't exist within $PATH" do
      subject.executable_path('fake').should be_nil
    end
  end
end