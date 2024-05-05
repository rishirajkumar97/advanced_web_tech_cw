<template>
<b-navbar toggleable="md" type="dark" variant="info">
  <b-container>
    <b-navbar-toggle target="nav_collapse"></b-navbar-toggle>
    <b-navbar-brand to="/">FinApp</b-navbar-brand>
    <b-collapse is-nav id="nav_collapse">
      <b-navbar-nav class="ml-auto" >
        <b-nav-item to="/perview" v-if="loggedinState">Performers</b-nav-item>
        
        <b-nav-item to="/category/front-end" v-if="loggedinState">News feeds</b-nav-item>
        <b-nav-item to="/chart" v-if="loggedinState">Charts</b-nav-item>
                <b-nav-item to="/editprofile" v-if="loggedinState">editprofile</b-nav-item>
  
   
                <b-nav-item to="/auth" v-if="!loggedinState">Signin/Signup</b-nav-item>
                 <b-nav-item @click="logoutt" v-if="  loggedinState">Logout</b-nav-item>
      </b-navbar-nav>
    </b-collapse>
  </b-container>
</b-navbar>
</template>

<script>
import { mapGetters, mapActions } from 'vuex';

export default {
  name: 'AppNavbar',
  computed: {
    loggedinState(){
   return localStorage.getItem('auth_token');

},
 
    ...mapGetters('authenticationModule', ['isAuthenticated']),
  },
  
  methods: {
    ...mapActions('authenticationModule', { logout: 'logout' }),
    logoutt() {
      this.$store.dispatch("authPageModule/logout");
  },
  
}};
</script>

<style>

</style>
