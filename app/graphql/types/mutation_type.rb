module Types
  class MutationType < Types::BaseObject
    field :create_user, mutation: Mutations::CreateUser
    field :auth_user, mutation: Mutations::AuthenticateUser
  end
end
