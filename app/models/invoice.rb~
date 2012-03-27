class Invoice < ActiveRecord::Base
	has_many :items, :dependent => :destroy
	belongs_to :client
	accepts_nested_attributes_for :items, :allow_destroy => true
end
