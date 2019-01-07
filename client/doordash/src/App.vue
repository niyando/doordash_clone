<template>
  <div id="app">
    <app-header></app-header>
    
    <router-view :key="$route.fullPath" class="" />
    <router-view class="cart-container" name="cart"></router-view>
    <router-view class="cart-container" name="group_cart"></router-view>
    
  </div>
</template>

<script>
import AppHeader from './components/AppHeader'

export default {
  name: 'App',
  components: {
    AppHeader
  }
}
</script>

<style>
#app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}
.cart-container{
  position: fixed;
  width: 400px;
  right: 0;
  top: 0px;
  background: lightgoldenrodyellow;
  height: 100%;
  overflow-y: scroll;
  padding: 20px;
  padding-top: 60px;
}
</style>
