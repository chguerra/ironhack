class User < ActiveRecord::Base
  	has_many :products
    has_secure_password
    validates :email, uniqueness: true
    validates :email, presence: true
end
