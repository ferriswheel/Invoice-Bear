class Contact < ActiveRecord::Base
	has_many :invoices
	belongs_to :user
	
	validates :fname, :lname, :email, :bname, :presence => true

end
