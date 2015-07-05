class User < ActiveRecord::Base
	attr_accessor :remember_tocken
	before_save :downcase_email
	validates :name,presence: true, length: { maximum:30 }
	VALID_EMAIL = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email,presence: true, length: { maximum:255 },
									 format: { with: VALID_EMAIL },
									 uniqueness: { case_sensitive: false }

	validates :password,presence: true, length: { minimum: 6},
											allow_nil: true 
	has_secure_password



	private
		def downcase_email
			self.email = email.downcase
		end
end
