<template>
  <div class="cart">
    <h2 class="is-size-4 "> Cart Summary</h2>
    <h4 v-if="loading">Loading...</h4>
    <p>{{totalItems}} items added to your cart.</p>
    <br>
    <cart-item
      v-for="ci in cartItems"
      :key="ci.id"
      :cart_item="ci">
    </cart-item>
    <br>
    <button v-if="userId" @click="createGroupCart()" class="button">Create Group Cart</button>
  </div>
</template>

<script>
  import { CART_ITEMS_QUERY, CREATE_GROUP_CART_MUTATION } from '../constants/graphql'
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
        return this.cartItems && this.cartItems.length
      },
      userId () {
        return this.$root.$data.userId
      }
    },
    apollo: {
      cartItems: {
        query: CART_ITEMS_QUERY
      }
    },
    methods: {
      createGroupCart(){
        this.$apollo.mutate({
          mutation: CREATE_GROUP_CART_MUTATION
        }).then(({ data: { createGroupCart: {groupCart } } }) => {
          this.$router.push({name: 'group_cart', params: {token: groupCart.token}})
        })
      }
    }
  }
</script>

<style scoped>

</style>
