class Mutations::AddToCart < Mutations::BaseMutation
  null true

  argument :item_id, Int, required: true

  field :cart_item, Types::CartItemType, null: true
  field :errors, [String], null: false

  def resolve(args)
    user = context[:current_user]
    cart = user.cart || user.create_cart
    item = Item.find(args[:item_id])
    cart_item = cart.cart_items.where(item: item).first
    if cart_item.present?
      cart_item.quantity = cart_item.quantity + 1
      item_added = cart_item.save
    else
      cart_item = cart.cart_items.create(item: item , quantity: 1)
      item_added = cart_item.persisted?
    end

    if item_added
      {cart_item: cart_item, errors: []}
    else
      {cart_item: nil, errors: cart_item.errors.full_messages }
    end
  end
end