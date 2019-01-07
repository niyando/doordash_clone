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

export const ADD_TO_CART_MUTATION = gql`
  mutation AddToCart($item_id: Int!) {
    addToCart(itemId: $item_id){
      cartItems{
        id
        item{
          id
          name
          amount
        }
        quantity
      }
      errors
    }
  }
`

export const REMOVE_FROM_CART_MUTATION = gql`
  mutation RemoveFromCart($item_id: Int!) {
    removeFromCart(itemId: $item_id){
      cartItems{
        id
        item{
          id
          name
          amount
        }
        quantity
      }
      errors
    }
  }
`

export const CREATE_GROUP_CART_MUTATION = gql`
  mutation CreateGroupCart {
    createGroupCart{
      groupCart{
        token
      }
      errors
    }
  }
`

export const GROUP_CART_ITEMS_QUERY = gql`
  query GroupCartItemsQuery($token: String!) {
    groupCartItems(token: $token){
      item{
        id
        name
        amount
        abbrDescription
      }
      user{
        id
        name
      }
      quantity
    }
  }
`