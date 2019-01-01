module Types
  class QueryType < Types::BaseObject
    
    field :items, [ItemType], null: true do
      description "gets all items"
    end
    def items
      Item.all
    end

    field :item, ItemType, null: true do
      description "gets the requested item"
      argument :id, ID, required: true
    end
    def item(params)
      Item.find(params[:id])
    end
    
  end
end
