class User < ApplicationRecord
  has_one :cart
  has_one :group_cart

  has_secure_password
  has_secure_token :auth_token

  validates_presence_of :name, :email
  validates_uniqueness_of :email
end
