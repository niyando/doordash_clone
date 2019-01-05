module Types
  class GroupCartType < GraphQL::Schema::Object
    field :token, String, null: false
  end
end