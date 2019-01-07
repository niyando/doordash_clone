<template>
  <div class="cart-items">
    <div>
      <b>{{user_item.item.name}}</b>
      <span style="float:right"><b>${{user_item.item.amount}}</b></span>
    </div>
    <div><b>Quantity:</b>&nbsp;{{user_item.quantity}}</div>
    <!-- <a href @click.prevent="remove(user_item.item.id)">Remove</a> -->
  </div>
</template>

<script>


  export default {
    name: 'UserItem',
    props: ['user_item']
  }
</script>

<style scoped>
  .cart-items{
    padding: 5 0px;
    margin-bottom: 5px;
  }
</style>
