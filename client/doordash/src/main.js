import { ApolloClient } from 'apollo-client'
import { ApolloLink } from 'apollo-link'
import { HttpLink } from 'apollo-link-http'
import { InMemoryCache } from 'apollo-cache-inmemory'

import Vue from 'vue'

import VueApollo from 'vue-apollo'

import App from './App'
import router from './router'

import 'bulma/css/bulma.css'

import { APP_USER_ID, APP_AUTH_TOKEN } from './constants/settings'
let userId = localStorage.getItem(APP_USER_ID)

Vue.config.productionTip = false

const httpLink = new HttpLink({
  // You should use an absolute URL here
  uri: 'http://127.0.0.1:3000/graphql'
})

const authMiddleware = new ApolloLink((operation, forward) => {
  // add the authorization to the headers
  const token = localStorage.getItem(APP_AUTH_TOKEN)
  operation.setContext({
    headers: {
      authorization: token ? `Token token=${token}` : null
    }
  })
  return forward(operation)
})

const link = authMiddleware.concat(httpLink)

const apolloClient = new ApolloClient({
  link: link,
  cache: new InMemoryCache(),
  connectToDevTools: true
})

Vue.use(VueApollo)

const apolloProvider = new VueApollo({
  defaultClient: apolloClient,
  defaultOptions: {
    $loadingKey: 'loading'
  }
})

/* eslint-disable no-new */
new Vue({
  el: '#app',
  provide: apolloProvider.provide(),
  router,
  data: {
    userId
  },
  render: h => h(App)
})
