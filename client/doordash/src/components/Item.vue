<template>
  <div class="items">
    <div class="columns">
      <div class="column is-three-quarters"><b>{{item.name}}</b></div>
      <div class="column"><b>${{item.amount}}</b></div>
    </div>
    <div class="has-text-grey-light">{{item.abbrDescription}}</div>
    <button @click="addToCart(item.id)" class="button add-to-cart">Add to Cart</button>
  </div>
</template>

<script>
  import { ADD_TO_CART_MUTATION } from '../constants/graphql'
  import { CART_ITEMS_QUERY } from '../constants/graphql'

  export default {
    name: 'Item',
    props: ['item'],
    computed: {
      userId () {
        return this.$root.$data.userId
      }
    },
    methods: {
      addToCart(id){
        if(!this.userId){
          this.$router.push({name: 'login'})
          return false;
        }
        const item_id = parseInt(id) 
        this.$apollo.mutate({
          mutation: ADD_TO_CART_MUTATION,
          variables: {
            item_id
          },
          update: (store, { data: { addToCart: {cartItems } } }) => {
            const data = store.readQuery({ query: CART_ITEMS_QUERY })
            data.cartItems = cartItems
            store.writeQuery({ query: CART_ITEMS_QUERY, data })
          }
        })
      }
    }
  }
</script>

<style scoped>
  .items{
    padding: 10px;
    margin-bottom: 20px;
    max-width: 400px;
  }
  .add-to-cart{
    margin-top: 10px;
  }
</style>
