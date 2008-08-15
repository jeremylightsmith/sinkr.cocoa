class FlickrEventsController < OSX::NSObject
  attr_accessor :view
  attr_writer :app_controller
  
  def numberOfRowsInTableView(view)
    1
  end
  
  def tableView_objectValueForTableColumn_row(view, column, row)
    'hi'
  end
end
