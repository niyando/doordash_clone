module Types
  class GroupCartItemType < GraphQL::Schema::Object
    field :user_id, ID, null: false
    field :user, UserType, null: false
    field :item, ItemType, null: false
    field :quantity, Int, null: false
  end
end