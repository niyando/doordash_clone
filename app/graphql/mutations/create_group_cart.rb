class Mutations::CreateGroupCart < Mutations::BaseMutation
  null true

  field :group_cart, Types::GroupCartType, null: true
  field :errors, [String], null: false

  def resolve
    user = context[:current_user]
    group_cart = user.group_cart || user.create_group_cart
    if group_cart
      {group_cart: group_cart, errors: []}
    else
      {group_cart: nil, errors: group_cart.errors.full_messages }
    end
  end
end