require 'spec_helper'

describe "clients/edit" do
  before(:each) do
    @client = assign(:client, stub_model(Client,
      :fname => "MyString",
      :lname => "MyString",
      :address => "MyString",
      :city => "MyString",
      :state => "MyString",
      :zip => 1,
      :phone => "MyString",
      :mphone => "MyString",
      :fax => "MyString",
      :email => "MyString",
      :balance => "9.99",
      :bname => "MyString"
    ))
  end

  it "renders the edit client form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => clients_path(@client), :method => "post" do
      assert_select "input#client_fname", :name => "client[fname]"
      assert_select "input#client_lname", :name => "client[lname]"
      assert_select "input#client_address", :name => "client[address]"
      assert_select "input#client_city", :name => "client[city]"
      assert_select "input#client_state", :name => "client[state]"
      assert_select "input#client_zip", :name => "client[zip]"
      assert_select "input#client_phone", :name => "client[phone]"
      assert_select "input#client_mphone", :name => "client[mphone]"
      assert_select "input#client_fax", :name => "client[fax]"
      assert_select "input#client_email", :name => "client[email]"
      assert_select "input#client_balance", :name => "client[balance]"
      assert_select "input#client_bname", :name => "client[bname]"
    end
  end
end
