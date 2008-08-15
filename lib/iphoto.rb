class IPhoto
  attr_reader :library_dir
    
  def initialize(library_dir = "~/Pictures/iPhoto Library")
    @library_dir = File.expand_path(library_dir)
    raise "Library path #{library_dir} not found" unless File.directory?(@library_dir)
  end
  
  def events
    @events ||= Dir[library_dir + "/Originals/*/*"].map {|dir| Event.new(dir)}
  end
  
  def years
    @years ||= Dir[library_dir + "/Originals/*"].map {|dir| Year.new(dir)}
  end
  
  class Year < Struct.new(:path)
    def name
      File.basename(path)
    end
    
    def events
      @events ||= Dir[path + "/*"].map {|event_path| Event.new(event_path)}
    end
    
    def inspect
      "iPhoto::Year(#{name})"
    end
  end
end