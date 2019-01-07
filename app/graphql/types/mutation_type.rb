module Types
  class MutationType < Types::BaseObject
    field :create_user, mutation: Mutations::CreateUser
    field :auth_user, mutation: Mutations::AuthenticateUser
    field :add_to_cart, mutation: Mutations::AddToCart
    field :remove_from_cart, mutation: Mutations::RemoveFromCart

    field :create_group_cart, mutation: Mutations::CreateGroupCart
    field :delete_group_cart, mutation: Mutations::DeleteGroupCart
    field :add_to_group_cart, mutation: Mutations::AddToGroupCart
    field :remove_from_group_cart, mutation: Mutations::RemoveFromGroupCart
  end
end
