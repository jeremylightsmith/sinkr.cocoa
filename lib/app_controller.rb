class AppController < OSX::NSObject
  include OSX
  attr_accessor :window, :years, :iphoto_events, :flickr_events
    
  def awakeFromNib
    # bring to front when launched from command line
    NSApplication.sharedApplication.activateIgnoringOtherApps(true)  
  end
  
  def applicationDidFinishLaunching(notification)
  end
  
  def dealloc
    super_dealloc
  end
  
  def applicationShouldTerminate(app)
    # NSTerminateLater
    NSTerminateNow
  end
end
