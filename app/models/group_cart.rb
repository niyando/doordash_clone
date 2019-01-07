class GroupCart < ApplicationRecord
  belongs_to :user
  has_many :group_cart_items, dependent: :destroy
  has_many :items, through: :group_cart_items

  has_secure_token
end
