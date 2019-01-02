<template>
  <div>
    <h4>Login</h4>
    <form @submit.prevent="login">
      <label for="email" >E-Mail Address</label>
      <div>
        <input id="email" type="email" class="input" v-model="email" required autofocus>
      </div>
      <div>
        <label for="password" >Password</label>
        <div>
            <input id="password" type="password" class="input" v-model="password" required>
        </div>
      </div>
      <div>
        <button class="button" type="submit">
            Login
        </button>
      </div>
    </form>
  </div>
</template>

<script>
  import { APP_USER_ID, APP_AUTH_TOKEN } from '../constants/settings'
  import { LOGIN_MUTATION } from '../constants/graphql'
  export default {
      data(){
          return {
              email : "",
              password : ""
          }
      },
      methods : {
          saveUserData(id, token) {
            localStorage.setItem(APP_USER_ID, id)
            localStorage.setItem(APP_AUTH_TOKEN, token)
            this.$root.$data.userId = localStorage.getItem(APP_USER_ID)
          },
          login(){
            const { email, password } = this.$data
            this.$apollo.mutate({
              mutation: LOGIN_MUTATION,
              variables: {
                email,
                password
              }
            }).then((result) => {
              if(result.data.authUser.user){
                const id = result.data.authUser.user.id
                const token = result.data.authUser.user.authToken
                this.saveUserData(id, token)
                this.$router.push('/')
              }else{
                alert(result.data.authUser.errors[0])
              }
            })    
          }
      }
  }
</script>