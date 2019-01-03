<template>
  <div class="cart">
    <h4 v-if="loading">Loading...</h4>
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
    apollo: {
      cartItems: {
        query: CART_ITEMS_QUERY
      }
    }
  }
</script>

<style scoped>

</style>
