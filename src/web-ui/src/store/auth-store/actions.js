import axios from 'axios'
import router from '../../router/index'
import { state } from './state.js'

export const actions = {
    loginAndSaveToken(context, { username, password }) {
    
      axios.post('https://meta-geography-243114.nw.r.appspot.com/login', { user:  { email: username, password: password } } ).then((response) => {
            let token = response.data.status.data.token;
            localStorage.setItem('auth_token', token);  
            localStorage.setItem('email',username);
            localStorage.setItem('password',password);
            localStorage.setItem('name',response.data.status.data.user.name);
            router.push('/editprofile');
            window.location.reload();
         

        }).catch((error) => {
            console.log(error);
            //will always redirect to profile np
            window.alert(" Couldn't authenticate user, Check email or password!");
        });
      
    },

    logout(context) {
        const token = window.localStorage.getItem('auth_token');
        if (token) {
            const config = {
                headers: {
                    Authorization: token // Set the authorization header
                }
            };
    
            // Make the axios delete request with the configuration
            axios.delete('https://meta-geography-243114.nw.r.appspot.com/logout', config)
            .then((response) => {
                localStorage.removeItem('auth_token'); // Remove the token from localStorage
                router.push('/auth');   
                window.location.reload();
            })
            .catch((error) => {
                console.log(error);
                router.push('/404');
            });
        } else {
            // Handle the case where no token is found
            console.log('No authentication token found.');
            router.push('/auth');
        }
    },

    updateName(context, { name, email }) {
   
        console.log("Frm actions",name, email )
        const token = window.localStorage.getItem('auth_token');
        if (token) {
            const config = {
                headers: {
                    Authorization: token // Set the authorization header
                }
            };
         axios.put('https://meta-geography-243114.nw.r.appspot.com/update_name',//CHECK
         {
            name: name

         }, config).then((response) => {
  
            localStorage.setItem('name',name);
            window.alert("Your Name was updated successfully to (( " +name+" ))");
          })
          .catch((error) => {
            console.log(error);
            router.push('/404');
          });
        }
      
   
      },
       

      updatePassword(context, { password,oldPassword }) {
        console.log("Frm actions update Password", password, oldPassword)
      
        const token = window.localStorage.getItem('auth_token');
        if (token) {
            const config = {
                headers: {
                    Authorization: token // Set the authorization header
                }
            };
         axios.put('https://meta-geography-243114.nw.r.appspot.com/update_password',//CHECK
         {
            current_password: oldPassword,
            password: password,
            password_confirmation: password
         }, config).then((response) => {
  
            window.alert(" Your password was updated successfully");
          })
          .catch((error) => {
            console.log(error);
            window.alert(" Couldn't authenticate user, Check your current password!");
           
          });
        }
      },

      signup(context) {
       console.log("FormData", state.formData);
    
        axios.post('http://meta-geography-243114.nw.r.appspot.com/signup', { user:  
        { email:"jawid@gmail.com3", password: "Test121212",name:"jj"} } ).then((response) => {
        // { email: state.formData.email, password: state.formData.password,name:state.formData.name} } ).then((response) => {
              router.push('/auth');
              window.location.reload();
              window.alert(" Your account was created successfully, You can login now");
  
          }).catch((error) => {
              console.log(error);
              //will always redirect to profile np
              window.alert(" Couldn't signup" );
            //   window.alert(" Couldn't signup" + response.data.status.message);
          });
        
      },
};