<template>
  <div class="cart-items">
    <div>
      <b>{{cart_item.item.name}}</b>
      <span style="float:right"><b>${{cart_item.item.amount}}</b></span>
    </div>
    <div class="has-text-grey-light">{{cart_item.item.abbrDescription}}</div>
    <div><b>Quantity:</b>&nbsp;{{cart_item.quantity}}</div>
  </div>
</template>

<script>
  export default {
    name: 'CartItem',
    props: ['cart_item']
  }
</script>

<style scoped>
  .cart-items{
    padding: 10px;
    margin-bottom: 15px;
    border-bottom: 1px solid #d2d2d2;
  }
</style>
