<template>
  <div class="cart">
    <h2 class="is-size-4 ">Group Cart Summary</h2>
    <p class="is-size-6">
      Share the following URL to allow other people to add to your cart
    </p>
    <div class="is-size-6" style="margin: 2px; padding: 5px; background: #fafafa; overflow-wrap:break-word;">
      <a class="has-text-danger" vi-bind:href="'http://localhost:8080/group/'+groupToken">http://localhost:8080/group/{{groupToken}}</a>
    </div>
    
    <user-items
      v-for="ui in userItems"
      :key="ui.id"
      :user_items="ui">
    </user-items>
    
  </div>
</template>

<script>
  import UserItems from './UserItems'
  import { GROUP_CART_ITEMS_QUERY } from '../constants/graphql'
  export default {
    name: 'GroupCart',
    components: {
      UserItems
    },
    data () {
      return {
        groupCartItems: [],
        groupToken: this.$route.params.token
      }
    },
    apollo: {
      groupCartItems: {
        query: GROUP_CART_ITEMS_QUERY,
        variables() {
          return{
              token: this.groupToken
          }
        }
      }
    },
    computed: {
      userItems: function(){
        let users = []
        this.groupCartItems.forEach((gc_item) => {
          let user = users.find(function(u){return u.id == gc_item.user.id})
          if(user){
            user.items.push({
              item: gc_item.item,
              quantity: gc_item.quantity
            })
          }else{
            users.push({
              id: gc_item.user.id,
              name: gc_item.user.name,
              items: [{
                item: gc_item.item,
                quantity: gc_item.quantity
              }]
            })
          }
        })
        return users
      }
    }
  }
</script>

<style scoped>

</style>
