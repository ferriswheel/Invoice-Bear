class Contact < ActiveRecord::Base
	has_many :invoices
end
