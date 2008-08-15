class YearsController < OSX::NSObject
  attr_accessor :view, :iphoto
  attr_writer :app_controller
  
  def numberOfRowsInTableView(view)
    puts "there we were..."
    @iphoto ||= IPhoto.new
    puts "bang"
    puts iphoto.years.size
    iphoto.years.size
    
  end
  
  def tableView_objectValueForTableColumn_row(view, column, row)
    iphoto.years[row].name
  end
end
