<template>
  <div class="cart-items">
    <div>
      <b>{{user_item.item.name}}</b>
      <span style="float:right"><b>${{user_item.item.amount}}</b></span>
    </div>
    <div><b>Quantity:</b>&nbsp;{{user_item.quantity}} </div>
    <a v-if="userId == user_id" href @click.prevent="remove(user_item.item.id)">Remove</a>
  </div>
</template>

<script>
  import { REMOVE_FROM_GROUP_CART_MUTATION, GROUP_CART_ITEMS_QUERY } from '../constants/graphql'

  export default {
    name: 'UserItem',
    props: ['user_item', 'user_id'],
    data(){
      return {
        groupToken: this.$route.params.token
      }
    },
    computed: {
      userId: function(){
        return this.$root.$data.userId
      }
    },
    methods: {
      remove(id){
        const item_id = parseInt(id) 
        const token = this.groupToken
        this.$apollo.mutate({
          mutation: REMOVE_FROM_GROUP_CART_MUTATION,
          variables: {
            token,
            item_id
          },
          update: (store, { data: { removeFromGroupCart } }) => {
            const data = store.readQuery({ query: GROUP_CART_ITEMS_QUERY, variables: {token: this.groupToken} })
            data.groupCartItems = removeFromGroupCart.groupCartItems
            store.writeQuery({ query: GROUP_CART_ITEMS_QUERY, variables: {token: this.groupToken}, data })
          }
        })
      }
    }
  }
</script>

<style scoped>
  .cart-items{
    padding: 5 0px;
    margin-bottom: 5px;
  }
</style>
