class IPhotoEventsController < OSX::NSObject
  attr_accessor :view, :iphoto
  attr_writer :app_controller
  
  def numberOfRowsInTableView(view)
    puts "here we are..."
    @iphoto ||= IPhoto.new
    iphoto.events.size
  end
  
  def tableView_objectValueForTableColumn_row(view, column, row)
    case column.headerCell.stringValue
    when 'iPhoto'
      iphoto.events[row].name
    when 'flickr'
      "f + #{row}"
    else 
      # raise "what the!?!"
    end
  end
end
