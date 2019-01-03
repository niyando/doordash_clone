module Types
  class CartItemType < GraphQL::Schema::Object
    field :id, ID, null: false
    field :item, ItemType, null: false
    field :quantity, Int, null: false
  end
end