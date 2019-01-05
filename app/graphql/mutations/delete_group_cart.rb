class Mutations::DeleteGroupCart < Mutations::BaseMutation
  null true

  field :group_cart, Types::GroupCartType, null: true
  field :errors, [String], null: false

  def resolve(args)
    user = context[:current_user] || User.first
    user.group_cart.destroy
    {group_cart: user.group_cart, errors: []}
  end
end