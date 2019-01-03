<template>
  <div class="cart-items">
    <div>
      <b>{{cart_item.item.name}}</b>
      <span style="float:right"><b>${{cart_item.item.amount}}</b></span>
    </div>
    <div class="has-text-grey-light">{{cart_item.item.abbrDescription}}</div>
    <div><b>Quantity:</b>&nbsp;{{cart_item.quantity}}</div>
    <a href @click.prevent="remove(cart_item.item.id)">Remove</a>
  </div>
</template>

<script>
  import { REMOVE_FROM_CART_MUTATION } from '../constants/graphql'
  import { CART_ITEMS_QUERY } from '../constants/graphql'

  export default {
    name: 'CartItem',
    props: ['cart_item'],
    methods: {
      remove(id){
        const item_id = parseInt(id) 
        this.$apollo.mutate({
          mutation: REMOVE_FROM_CART_MUTATION,
          variables: {
            item_id
          },
          update: (store, { data: { removeFromCart: {cartItem } } }) => {
            const data = store.readQuery({ query: CART_ITEMS_QUERY })
            data.cartItems.splice(data.cartItems.findIndex(obj => obj.item.id == cartItem.item.id), 1)
            store.writeQuery({ query: CART_ITEMS_QUERY, data })
          }
        })
      }
    }
  }
</script>

<style scoped>
  .cart-items{
    padding: 10px 0px;
    margin-bottom: 15px;
    border-bottom: 1px solid #d2d2d2;
  }
</style>
