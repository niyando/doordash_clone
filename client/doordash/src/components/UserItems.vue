<template>
  <div class="user-items">
    <div>
      <div class="has-text-danger">
        {{user_items.name}}
        <span v-if="userId == user_items.id" class="has-text-grey">&nbsp;(You)</span>
      </div>
      <div>
            <user-item
              v-for="ui in user_items.items"
              :key="ui.id"
              :user_item="ui">
            </user-item>
      </div>
    </div>
  </div>
</template>

<script>
  import UserItem from './UserItem'
  export default {
    name: 'UserItems',
    props: ['user_items'],
    components: {
      UserItem
    },
    computed: {
      userId: function(){
        return this.$root.$data.userId
      }
    }
  }
</script>

<style scoped>
  .user-items{
    padding: 10px 0px;
    margin-bottom: 15px;
    border-bottom: 1px solid #d2d2d2;
  }
</style>
