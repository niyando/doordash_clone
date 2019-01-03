<template>
  <nav class="navbar is-danger" role="navigation" aria-label="main navigation">
    <div class="navbar-brand">
      <a class="navbar-item" href="/">
        <img src="https://bulma.io/images/bulma-logo.png" alt="Bulma: Free, open source, & modern CSS framework based on Flexbox" width="112" height="28">
      </a>

      <a role="button" class="navbar-burger" aria-label="menu" aria-expanded="false">
        <span aria-hidden="true"></span>
        <span aria-hidden="true"></span>
        <span aria-hidden="true"></span>
      </a>
    </div>

    <div class="navbar-menu">
      <div class="navbar-end">
        <div class="navbar-item">
          <div class="buttons">
            <a v-if="userId" class="button is-light" @click="logout()">Logout</a>
            <router-link v-if="!userId && showHeaderMenu" to="/login" class="button is-primary">Login</router-link>
          </div>
        </div>
      </div>
    </div>

  </nav>
</template>

<script>
  import { APP_USER_ID, APP_AUTH_TOKEN } from '../constants/settings'

  export default {
    name: 'AppHeader',
    computed: {
      userId () {
        return this.$root.$data.userId
      },
      showHeaderMenu () {
        return this.$route.name !== 'login'
      }
    },
    methods: {
      logout () {
        localStorage.removeItem(APP_USER_ID)
        localStorage.removeItem(APP_AUTH_TOKEN)
        this.$root.$data.userId = localStorage.getItem(APP_USER_ID)
        this.$apollo.provider.defaultClient.resetStore()
        this.$router.push({name: 'login'})
        
      }
    }
  }
</script>
