<template>
  <div class="login-container">

    <form @submit.prevent="login">
      <div class="field">
        <label for="email" >E-Mail Address</label>
        <div class="control">
          <input id="email" type="email" class="input" v-model="email" required autofocus>
        </div>
      </div>
      
      <div class="field">
        <label for="password" >Password</label>
        <div class="control">
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
            console.log(this.$root.$data.userId)
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
                this.$router.push({name: 'items'})
              }else{
                alert(result.data.authUser.errors[0])
              }
            })    
          }
      }
  }
</script>

<style scoped>
  .login-container{
    margin: 30px;
    max-width: 500px;
  }
</style>
