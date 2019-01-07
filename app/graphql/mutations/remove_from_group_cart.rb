class Mutations::RemoveFromGroupCart < Mutations::BaseMutation
  null true

  argument :token, String, required: true
  argument :item_id, Int, required: true

  field :group_cart_items, [Types::GroupCartItemType], null: true
  field :errors, [String], null: false

  def resolve(args)
    user = context[:current_user]
    group_cart = GroupCart.find_by_token(args[:token])
    item = Item.find(args[:item_id])

    cart_item = group_cart.cart_items.where(item: item, user: user).first
    deleted = cart_item.destroy if cart_item.present?
    {group_cart_items: group_cart.cart_items, errors: []}
  end

end