class GroupCartItem < ApplicationRecord
  belongs_to :group_cart
  belongs_to :item
  belongs_to :user
end
