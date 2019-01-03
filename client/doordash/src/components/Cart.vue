<template>
  <div class="cart">
    <h2 class="is-size-5 "> Cart Summary</h2>
    <h4 v-if="loading">Loading...</h4>
    <p>{{totalItems}} items added to your cart.</p>
    <br>
    <cart-item
      v-for="ci in cartItems"
      :key="ci.id"
      :cart_item="ci">
    </cart-item>
    
  </div>
</template>

<script>
  import { CART_ITEMS_QUERY } from '../constants/graphql'
  import CartItem from './CartItem'

  export default {
    name: 'Cart',
    data () {
      return {
        cartItems: [],
        loading: 0
      }
    },
    components: {
      CartItem
    },
    computed: {
      totalItems: function(){
        return this.cartItems.length
      }
    },
    apollo: {
      cartItems: {
        query: CART_ITEMS_QUERY
      }
    }
  }
</script>

<style scoped>

</style>
