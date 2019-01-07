module Types
  class GroupCartType < GraphQL::Schema::Object
    field :token, String, null: false
    field :user_id, ID, null: false
  end
end