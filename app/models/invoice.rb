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
end
