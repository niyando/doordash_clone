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
    
  end
end
