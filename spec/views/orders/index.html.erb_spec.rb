require 'spec_helper'

describe "orders/index" do
  before(:each) do
    assign(:orders, [
      stub_model(Order,
        :barcode => "Barcode"
      ),
      stub_model(Order,
        :barcode => "Barcode"
      )
    ])
  end

  it "renders a list of orders" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Barcode".to_s, :count => 2
  end
end
