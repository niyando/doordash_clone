import gql from 'graphql-tag'

export const ALL_ITEMS_QUERY = gql`
  query AllItemsQuery {
    items {
      id
      name
      description
      abbrDescription
      amount
    }
  }
`