<template>
  <div class="form-container sign-in-container mt-12">
    <v-form
      action="#"
      :class="{
        'px-2': $vuetify.breakpoint.smAndDown,
        'px-8': $vuetify.breakpoint.mdAndUp,
      }"
    >
      <img src="team.png" class="team-img pt-8" />
      <h1 class="pb-8 font-weight-bold">Sign in</h1>
      <v-text-field
        prepend-inner-icon="mdi-email"
        placeholder="Email"
        filled
        :rules="emailRules" 
        v-model="username"
      ></v-text-field>
      <v-text-field
        prepend-inner-icon="mdi-lock"
        placeholder="Password"
        :rules="passwordRules"
        type="password"
        v-model="password"
        filled
      ></v-text-field>
      <v-btn
        color="info"
        block
        
        tile
        class="pa-6 font-weight-bold"
        elevation="0"
      :disabled="!username || !password"
        @click="login()"
        >Sign In</v-btn
      >
      <v-row class="justify-center py-10">
       
      </v-row>
    </v-form>
  </div>
</template>
<script>
export default {
  data: () => {
    return {
      username: null,
      password: null,
       emailRules: [
        v => !!v || 'Email is required',
        v => /.+@.+\..+/.test(v) || 'Email must be valid', // Add email format validation rule
      ],
         passwordRules: [
        v => !!v || 'Password is required',
        v => (v && v.length >= 8) || 'Password must be at least 8 characters long',
        v => (v && /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).*$/.test(v)) || 'Password must contain at least one lowercase letter, one uppercase letter, and one number',
      ],
    };
  },
  methods: {
    login() {
      this.$store.dispatch("authPageModule/loginAndSaveToken", {
        username: this.username,
        password: this.password,
      });
    
     
    },
  },
};
</script>
<style scoped>
.sign-in-container {
  left: 0;
  width: 50%;
  z-index: 2;
}
.team-img {
  width: 50%;
}

.container.right-panel-active .sign-in-container {
  transform: translateX(100%);
}

.container.right-panel-active .overlay-container {
  transform: translateX(-100%);
}
.forgot-password-sm {
  font-size: 12px;
}
.forgot-password-md {
  font-size: 15px;
}
</style>