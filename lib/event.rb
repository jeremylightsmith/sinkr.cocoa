class IPhoto
  class Event < Struct.new(:path)
    def name
      File.basename(path)
    end
    
    def year
      File.basename(File.dirname(path))
    end
    
    def inspect
      "iPhoto::Event(#{name})"
    end
  end
end