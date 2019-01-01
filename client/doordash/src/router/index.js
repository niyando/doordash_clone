import Vue from 'vue'
import Router from 'vue-router'
import Item from '@/components/Item'
import ItemList from '@/components/ItemList'

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',
      name: 'ItemList',
      component: ItemList
    }
  ],
  mode: 'history'
})
