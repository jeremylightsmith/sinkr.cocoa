begin
require 'rubygems'
rescue LoadError
end
require 'osx/cocoa'

require 'fileutils'

module Kernel
  def puts(*args)
    $stderr.puts(*args)
  end
end

def log(*args)
	args.each do |m|
		OSX.NSLog m.inspect
	end
end

def _(key)
	NSLocalizedString(key, '').to_s
end

def ruby_files
  FileUtils.chdir File.dirname(__FILE__) do
    return Dir["**/*.rb"]
  end
end

if $0 == __FILE__ then
  require File.dirname(__FILE__) + "/sinkr"
  ruby_files.each do |f| 
    next if f == 'sinkr.rb' || f == 'main.rb'
    require f
  end
  OSX::NSApplication.sharedApplication
  OSX.NSApplicationMain(0, nil)
end
