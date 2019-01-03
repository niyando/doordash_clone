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

export const REGISTER_MUTATION = gql`
  mutation RegisterMutation($name: String!, $email: String!, $password: String!, $password_confirmation: String!){
    createUser(name: $name, email: $email, password: $password, passwordConfirmation: $password_confirmation){
    user{
      id
      name
      authToken
      }
      errors
    }
  }
`

export const CART_ITEMS_QUERY = gql`
  query CartItemsQuery {
    cartItems{
      id
      item{
        id
        name
        amount
      }
      quantity
    }
  }
`