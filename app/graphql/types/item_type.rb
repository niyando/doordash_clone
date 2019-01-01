module Types
  class ItemType < GraphQL::Schema::Object
    field :id, ID, null: false
    field :name, String, null: false
    field :description, String, null: true
    field :amount, Float, null: false
  end
end