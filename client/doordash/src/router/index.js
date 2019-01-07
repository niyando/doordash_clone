import Vue from 'vue'
import Router from 'vue-router'
import Item from '@/components/Item'
import ItemList from '@/components/ItemList'
import Login from '@/components/Login'
import Register from '@/components/Register'
import Cart from '@/components/Cart'
import CartItem from '@/components/CartItem'
import GroupCart from '@/components/GroupCart'

import { APP_AUTH_TOKEN } from '../constants/settings'

Vue.use(Router)

let router =  new Router({
  routes: [
    {
      path: '/',
      name: 'items',
      components: {
        default: ItemList,
        'cart': Cart
      }
    },
    {
      path: '/login',
      name: 'login',
      component: Login,
      meta: {
        guestOnly: true
      }
    },
    {
      path: '/register',
      name: 'register',
      component: Register,
      meta: {
        guestOnly: true
      }
    },
    {
      path: '/group/:token',
      name: 'group_cart',
      components: {
        default: ItemList,
        'group_cart': GroupCart
      },
      meta: {
        requiresAuth: true
      }
    },
  ],
  mode: 'history'
})

router.beforeEach((to, from, next) => {
  if(to.matched.some(record => record.meta.requiresAuth)) {
      if (localStorage.getItem(APP_AUTH_TOKEN) == null) {
        next({path: '/login'})
      } else {
        next()
      }
  } else if(to.matched.some(record => record.meta.guestOnly)) {
      if(localStorage.getItem(APP_AUTH_TOKEN) == null){
        next()
      }
      else{
        next({path: '/'})
      }
  }else {
    next() 
  }
})

export default router