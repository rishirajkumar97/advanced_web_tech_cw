<template>
  <div class="form-container sign-up-container">
    <v-form
      action="#"
      :class="{
        'px-2 mt-12': $vuetify.breakpoint.smAndDown,
        'px-8': $vuetify.breakpoint.mdAndUp,
      }"
    >
      <img src="team.png" class="team-img pt-10" />
      <h1 class="pb-12 font-weight-bold">Create Account</h1>
      <v-text-field
         ref="email" 
        placeholder="Email"
        prepend-inner-icon="mdi-email"
        filled
         :rules="emailRules" 
       
        v-model="formData.email"
      ></v-text-field>
      <v-text-field
        placeholder="Password"
        prepend-inner-icon="mdi-lock"
        filled
        :rules="passwordRules"
        v-model="formData.password"
        type="password"
      ></v-text-field>
      <v-btn
        color="info"
        block
        
        tile
        class="pa-6 font-weight-bold"
        elevation="0"
         :disabled="!formData.email|| !formData.password"
        @click="saveformData()"
        >Sign Up</v-btn
      >
    </v-form>
  </div>
</template>
<script>
export default {
  data: () => {
    return {
   emailRules: [
        v => !!v || 'Email is required',
        v => /.+@.+\..+/.test(v) || 'Email must be valid', // Add email format validation rule
      ],
         passwordRules: [
        v => !!v || 'Password is required',
        v => (v && v.length >= 8) || 'Password must be at least 8 characters long',
        v => (v && /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).*$/.test(v)) || 'Password must contain at least one lowercase letter, one uppercase letter, and one number',
      ],}},
  computed: {
    currentSignUpStep: {
      get: function () {
        return this.$store.getters["authPageModule/getCurrentSignUpStep"];
         console.log("validate",this.$refs.email.validate())
      },
      set: function (newVal) {
        this.$store.commit("authPageModule/setCurrentSignUpStep", newVal);
      },
    },
    formData: {
      get: function () {
        return this.$store.getters["authPageModule/getFormData"];
      },
      set: function () {
        this.$store.commit("authPageModule/setFormData", this.formData);
      },
    },
  
  },
  methods: {
    saveformData() {
      this.$store.commit("authPageModule/setFormData", this.formData);
      this.currentSignUpStep = 2;
        
    },
  },
};
</script>
<style scoped>
.sign-up-container {
  left: 0;
  width: 50%;
  opacity: 0;
  z-index: 1;
}
.team-img {
  width: 50%;
}

.container.right-panel-active .sign-up-container {
  transform: translateX(100%);
  opacity: 1;
  z-index: 5;
  animation: show 0s;
}

@keyframes show {
  0%,
  49.99% {
    opacity: 0;
    z-index: 1;
  }

  50%,
  100% {
    opacity: 1;
    z-index: 5;
  }
}
</style>