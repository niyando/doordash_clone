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

export const LOGIN_MUTATION = gql`
  mutation LoginMutation($email: String!, $password: String!){
    authUser(email: $email, password: $password){
    user{
      id
      name
      authToken
      }
      errors
    }
  }
`