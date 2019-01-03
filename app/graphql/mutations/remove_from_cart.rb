class Mutations::RemoveFromCart < Mutations::BaseMutation
  null true

  argument :item_id, Int, required: true

  field :cart_item, Types::CartItemType, null: true
  field :errors, [String], null: false

  def resolve(args)
    user = context[:current_user]
    cart = user.cart || user.create_cart
    item = Item.find(args[:item_id])
    cart_item = cart.cart_items.where(item: item).first
    deleted = cart_item.destroy if cart_item.present?
    {cart_item: cart_item, errors: []}
  end

end