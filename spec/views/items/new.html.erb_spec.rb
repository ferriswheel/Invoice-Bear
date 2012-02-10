require 'spec_helper'

describe "items/new" do
  before(:each) do
    assign(:item, stub_model(Item,
      :description => "MyText",
      :unit_cost => "9.99",
      :quantity => 1,
      :discount => "9.99",
      :invoice_id => 1
    ).as_new_record)
  end

  it "renders new item form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => items_path, :method => "post" do
      assert_select "textarea#item_description", :name => "item[description]"
      assert_select "input#item_unit_cost", :name => "item[unit_cost]"
      assert_select "input#item_quantity", :name => "item[quantity]"
      assert_select "input#item_discount", :name => "item[discount]"
      assert_select "input#item_invoice_id", :name => "item[invoice_id]"
    end
  end
end
