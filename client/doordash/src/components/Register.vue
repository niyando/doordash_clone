<template>
  <div class="login-container">

    <form @submit.prevent="register">

      <div class="field">
        <label for="email" >Name</label>
        <div class="control">
          <input id="name" type="text" class="input" v-model="name" required autofocus>
        </div>
      </div>

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

      <div class="field">
        <label for="passwordConfirmation" >Confirm Password</label>
        <div class="control">
            <input id="passwordConfirmation" type="password" class="input" v-model="password_confirmation" required>
        </div>
      </div>

      <div>
        <button class="button" type="submit">
            Register
        </button>
      </div>
    </form>
    <br>
    <div class="">
      <router-link to="/login" class="">Already registered? Login</router-link>
    </div>
  </div>
</template>

<script>
  import { APP_USER_ID, APP_AUTH_TOKEN } from '../constants/settings'
  import { REGISTER_MUTATION } from '../constants/graphql'
  export default {
      name: 'Register',
      data(){
          return {
              name: "",
              email : "",
              password : "",
              password_confirmation: ""
          }
      },
      methods : {
          saveUserData(id, token) {
            localStorage.setItem(APP_USER_ID, id)
            localStorage.setItem(APP_AUTH_TOKEN, token)
            this.$root.$data.userId = localStorage.getItem(APP_USER_ID)
            console.log(this.$root.$data.userId)
          },
          register(){
            const { name, email, password, password_confirmation } = this.$data
            this.$apollo.mutate({
              mutation: REGISTER_MUTATION,
              variables: {
                name,
                email,
                password,
                password_confirmation
              }
            }).then((result) => {
              if(result.data.createUser.user){
                const id = result.data.createUser.user.id
                const token = result.data.createUser.user.authToken
                this.saveUserData(id, token)
                this.$router.push({name: 'items'})
              }else{
                alert(result.data.createUser.errors[0])
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
