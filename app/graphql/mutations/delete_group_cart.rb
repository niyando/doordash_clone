class Mutations::DeleteGroupCart < Mutations::BaseMutation
  null true

  field :group_cart, Types::GroupCartType, null: true
  field :errors, [String], null: false

  def resolve
    user = context[:current_user]
    user.group_cart.destroy
    {group_cart: user.group_cart, errors: []}
  end
end