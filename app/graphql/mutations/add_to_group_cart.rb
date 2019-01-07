class Mutations::AddToGroupCart < Mutations::BaseMutation
  null true

  argument :token, String, required: true
  argument :item_id, Int, required: true

  field :group_cart_items, [Types::GroupCartItemType], null: true
  field :errors, [String], null: false

  def resolve(args)
    user = context[:current_user]
    group_cart = GroupCart.find_by_token(args[:token])
    item = Item.find(args[:item_id])
    cart_item = group_cart.group_cart_items.where(item: item, user: user).first
    if cart_item.present?
      cart_item.quantity = cart_item.quantity + 1
      item_added = cart_item.save
    else
      cart_item = group_cart.group_cart_items.create(item: item , user: user, quantity: 1)
      item_added = cart_item.persisted?
    end

    if item_added
      {group_cart_items: group_cart.group_cart_items, errors: []}
    else
      {group_cart_items: nil, errors: cart_item.errors.full_messages }
    end
  end
end