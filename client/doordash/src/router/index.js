import Vue from 'vue'
import Router from 'vue-router'
import Item from '@/components/Item'
import ItemList from '@/components/ItemList'
import Login from '@/components/Login'
import Register from '@/components/Register'

Vue.use(Router)

let router =  new Router({
  routes: [
    {
      path: '/',
      name: 'ItemList',
      component: ItemList
    },
    {
      path: '/login',
      name: 'Login',
      component: Login,
      meta: {
        guestOnly: true
      }
    },
    {
      path: '/register',
      name: 'Register',
      component: Register,
      meta: {
        guestOnly: true
      }
    }
  ],
  mode: 'history'
})

router.beforeEach((to, from, next) => {
  if(to.matched.some(record => record.meta.requiresAuth)) {
      if (localStorage.getItem('app-auth-token') == null) {
        next({path: '/login'})
      } else {
        next()
      }
  } else if(to.matched.some(record => record.meta.guestOnly)) {
      if(localStorage.getItem('app-auth-token') == null){
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