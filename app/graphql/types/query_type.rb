module Types
  class QueryType < Types::BaseObject
    
    field :items, [ItemType], null: true do
      description "gets all items"
    end
  
    def items
      Item.all
    end
    
  end
end
