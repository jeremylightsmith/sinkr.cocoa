require File.dirname(__FILE__) + '/spec_helper'

describe IPhoto::Event do
  it "should know about it's year & name" do
    event = IPhoto::Event.new("some/2008/some thing")
    event.year.should == "2008"
    event.name.should == "some thing"
  end
end