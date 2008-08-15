require File.expand_path(File.dirname(__FILE__) + "/../lib/sinkr")

gem "rspec", ">= 1.1.4"
gem "file_sandbox", ">= 0.4"
gem 'jeremylightsmith-fakeui', '>= 0.1'

require 'spec'
require 'file_sandbox_behavior'
require 'fakeui'

Spec::Runner.configure do |config|
end
