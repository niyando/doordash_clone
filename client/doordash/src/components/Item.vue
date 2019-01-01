<template>
  <div class="items">
    <div>
      <b>{{item.name}}</b>
      <span style="float:right"><b>${{item.amount}}</b></span>
    </div>
    <div>{{item.description}}</div>
  </div>
</template>

<script>
  export default {
    name: 'Item',
    props: ['item']
  }
</script>

<style scoped>
  .items{
    padding: 10px;
    margin-bottom: 20px;
    max-width: 300px;
  }
</style>
