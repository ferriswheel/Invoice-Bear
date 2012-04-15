class Invoice < ActiveRecord::Base
	
	has_many :items, :dependent => :destroy
	belongs_to :contact
	belongs_to :user
	accepts_nested_attributes_for :items, :allow_destroy => true
	


  def total
    @total = 0
    self.items.each do |item|
     @total += item.total_price
    end

    @total
  end
  
  def paypal_url(return_url, notify_url)
    values = {
      :business => 'kevin_1334464039_biz@kevincollignon.com',
      :cmd => '_cart',
      :upload => 1,
      :return => return_url,
      :invoice => id,
      :notify_url => notify_url
    }
    items.each_with_index do |item, index|
      values.merge!({
        "amount_#{index+1}" => item.unit_cost,
        "item_name_#{index+1}" => item.description,
        "item_number_#{index+1}" => item.id,
        "quantity_#{index+1}" => item.quantity
      })
    end
    "https://www.sandbox.paypal.com/cgi-bin/webscr?" + values.to_query
  end
end

