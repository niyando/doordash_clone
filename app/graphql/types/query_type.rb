module Types
  class QueryType < Types::BaseObject
    
    field :items, [ItemType], null: true do
      description "gets all items"
      argument :offset, Int, required: false, default_value: 0
      argument :keywords, String, required: false, default_value: nil
    end
    def items(args)
      Item
        .search(args[:keywords])
        .paginate(args[:offset])
        .order(created_at: :desc)
    end

    field :item, ItemType, null: true do
      description "gets the requested item"
      argument :id, ID, required: true
    end
    def item(args)
      Item.find(args[:id])
    end

    field :current_user, UserType, null: true do
      "gets the logged in user"
    end
    def current_user
      context[:current_user]
    end

    field :cart_items, [CartItemType], null: true do
      "gets all item in the cart of logged in user"
    end
    def cart_items
      user = context[:current_user]
      cart_items = []
      if user
        cart = user.cart || user.create_cart
        cart_items = cart.cart_items
      end
      cart_items
    end
    
  end
end
