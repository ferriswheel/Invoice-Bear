class User < ActiveRecord::Base
	acts_as_authentic
	
	has_many :invoices
	
	USER_TYPE = {
	  :user => "User",
	  :admin => "Admin"
	}
	
	def user
	  self.user_type == USER_TYPE[:user]
	end
	
	def admin
	  self.user_type == USER_TYPE[:admin]
	end
end
