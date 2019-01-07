<template>
  <div class="items card">
    <div class="columns">
      <div class="column is-four-fifths"><b>{{item.name}}</b></div>
      <div class="column">
        <span style="float:right;"><b>${{item.amount}}</b> </span>
      </div>
    </div>
    <div class="has-text-grey-light">{{item.description}}</div>
    <button v-if="!groupToken" @click="addToCart(item.id)" class="button is-primary add-to-cart">Add to Cart</button>
    <button v-else @click="addToGroupCart(item.id)" class="button is-primary add-to-cart">Add to Cart</button>
  </div>
</template>

<script>
  import { ADD_TO_CART_MUTATION } from '../constants/graphql'
  import { CART_ITEMS_QUERY } from '../constants/graphql'

  export default {
    name: 'Item',
    props: ['item'],
    data(){
      return {
        groupToken: this.$route.params.token
      }
    },
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
      },
      addToGroupCart(id){
        alert("Add item to group cart");
      }
    }
  }
</script>

<style scoped>
  .items{
    padding: 15px;
    margin-bottom: 20px;
    max-width: 500px;
  }
  .add-to-cart{
    margin-top: 10px;
  }
</style>
