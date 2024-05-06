<template>
 
<v-card class="custom-card" outlined color="grey lighten-4" >

  <v-container  :class="{
        'container pa-4 my-12': $vuetify.breakpoint.smAndDown,
        'container pa-10 my-12': $vuetify.breakpoint.mdAndUp,
      }">
    <!-- alert -->
    <v-row>
      <v-alert  v-if="showAlert" text type="success" border="left" width="100%" dismissible  class="custom-alert" @input="handleAlertClose">
        Thank you, <strong >{{ name }}</strong> Your Profile was created
        successfully !
      </v-alert>
    </v-row>

    <v-row class="justify-center pb-5">
      <span class="title text-secondary py-2 font-weight-bold">Change your profile details!</span>
    </v-row>
      <v-row>
    <v-text-field
  label="Full Name"
  prepend-inner-icon="mdi-account"
  :value="formData.name"
  v-model="formData.name"
  :hint="`Current Name: ${formData.name}`"
  required
  :rules="[v => !!v || 'Name is required']"
></v-text-field>
<v-text-field
  label="Email"
  prepend-inner-icon="mdi-email"
  :value="formData.email"
  readonly

></v-text-field> </v-row>
    <v-row>
    <v-col cols="6" md="3">
   

      </v-col>
      <v-col cols="12" md="6">
    <v-btn
          class="pa-3 ma-2 font-weight-bold white--text"
          tile text block
          @click="updateName()"
          style="background-color: #4CAF50; color: white;"
        >
           Update Name
</v-btn>

      </v-col>
    </v-row>
    
    <v-row>
   <v-text-field
  label="Current Password"
  prepend-inner-icon="mdi-lock"
v-model="oldPassword"
  required
  :rules="[v => !!v || 'Password is required']"
  type="password"
></v-text-field>

    <v-text-field
  label="New Password"
  prepend-inner-icon="mdi-lock"
  v-model="formData.password"
  required
  :rules="[v => !!v || 'Password is required']"
  type="password"
></v-text-field>

     </v-row>
        <v-row>
      <v-col cols="12" md="6">
 
  

      </v-col>
      <v-col cols="12" md="6">
    <v-btn
          class="pa-3 ma-2 font-weight-bold white--text"
          tile text block
          @click="updatePassword()"
          style="background-color: #4CAF50; color: white;"
        >
           Update Password
</v-btn>
       <v-btn
           style="background-color: #FF5252; color: white;"
          text
          block
          tile
          elevation="0"
          @click="backToPreviousPage()"
          class="pa-6 font-weight-bold"
        >
          Cancel
        </v-btn>

      </v-col>
    </v-row>
  </v-container>
    </v-card  >


    

</template>

<script>
export default {
   data() {
    return {
      oldPassword: '' 
    }
    },
  computed: {
    showAlert(){
 return this.$store.getters["authPageModule/getShowAlert"];
    },
    formData: {
      get: function () {
        return this.$store.getters["authPageModule/getFormData"];
      },
    },
    name() {
      if (!this.formData.name ) return "First Name not available";
      else return this.formData.name ;
    },
  },
  methods: {
   
    handleAlertClose() {
      // Method to invoke when the alert is closed
      console.log("Alert closed!");
        this.$store.commit("authPageModule/setShowAlert", false);
    },
 
    backToPreviousPage() {
      this.$router.back();
    },

    updateName() {
      this.$store.dispatch("authPageModule/updateName", {name: this.formData.name,email:this.formData.email});
    },

        updatePassword() {
      this.$store.dispatch("authPageModule/updatePassword", {email:this.formData.email , password:this.formData.password,oldPassword:this.oldPassword});
    },
  },
};
</script>

<style scoped>
.custom-card {
  width: 85%; /* Adjust as needed */
  margin: auto; /* Center the card */
  padding: 20px;
  background-color: #f5f5f5 !important;
}
.custom-alert {
 background-color: #ffeb9b !important; 
 color: black !important; /* Change the background color to your desired color */
}

</style>
