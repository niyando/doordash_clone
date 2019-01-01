module Types
  class UserType < GraphQL::Schema::Object
    field :id, ID, null: false
    field :name, String, null: false
    field :email, String, null: false
    field :auth_token, String, null: false
    field :created_at, String, null: false
  end
end