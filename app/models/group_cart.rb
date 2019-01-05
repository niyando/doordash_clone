class GroupCart < ApplicationRecord
  belongs_to :user
  has_many :group_cart_items
  has_many :items, through: :group_cart_items
end
