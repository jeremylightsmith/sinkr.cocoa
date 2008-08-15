require File.dirname(__FILE__) + '/spec_helper'

describe YearsController do
  attr_accessor :controller, :view
  
  before do
    @controller = YearsController.alloc.init
    @controller.view = @view = FakeUI::TableView.new
    @controller.iphoto = IPhoto.new
    
    @controller.iphoto.stub!(:years).and_return([IPhoto::Year.new('some/1998'), IPhoto::Year.new('some/1999')])
  end
  
  it "should show years from iphoto" do
    @controller.numberOfRowsInTableView(view).should == 2
    
    @controller.tableView_objectValueForTableColumn_row(view, nil, 0).should == '1998'
    @controller.tableView_objectValueForTableColumn_row(view, nil, 1).should == '1999'
  end
end