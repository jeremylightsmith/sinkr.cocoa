class Sinkr
  def self.version
    "0.1"
  end
  
  def self.root
    @root ||= File.expand_path(File.dirname(__FILE__) + "/..")
  end
end

$LOAD_PATH.unshift(Sinkr.root + "/lib")

require 'rubygems'
gem "flickraw", ">= 0.4.5"


require 'flickraw'
FlickRaw.api_key = '00633475f15879ad161d77bcb69b2ab5'
FlickRaw.shared_secret = '1b88f46d8c82ef6a'

require "array_ext"
require 'iphoto'

FLICKR_USER_ID = '30294775@N00'
