import axios from 'axios'
import router from '../../router/index'

export const actions = {
    loginAndSaveToken(context, { username, password }) {
        context.commit('setShowAlert',true);
        axios.post('https://meta-geography-243114.nw.r.appspot.com/login', { user:  { email: username, password: password } } ).then((response) => {
            let token = response.data.status.data.token;
            localStorage.setItem('auth_token', token);  
            state.formData.email = username;
            state.formData.password = password;
            state.formData.name = "the name";
            context.commit('setShowAlert',true);
            router.push('/editprofile');
            window.location.reload();
           

        }).catch((error) => {
            console.log(error);
            print("couldnot logged in")
            //will always redirect to profile np
            router.push('/404');
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
    //      this.axios.put('https://meta-geography-243114.nw.r.appspot.com/update',//CHECK
    //      formData  ).then((response) => {
  
    //         this.$swal({
    //           title: "Updated",
    //           text: "Your profile was updated successfully",
    //           icon: "success",
    //           confirmButtonText: "Done",
    //         });
    //       })
    //       .catch((error) => {
    //         this.$swal({
    //           title: "Oops, Something went wrong ! ",
    //           text: error.message,
    //           icon: "warning",
    //         });
    //       });
      },
       

      updatePassword(context, { email, password,oldPassword }) {
        console.log("Frm actions update Password",email, password, oldPassword)
      
    //      this.axios.put('https://meta-geography-243114.nw.r.appspot.com/update',//CHECK
    //      formData  ).then((response) => {
  
    //         this.$swal({
    //           title: "Updated",
    //           text: "Your profile was updated successfully",
    //           icon: "success",
    //           confirmButtonText: "Done",
    //         });
    //       })
    //       .catch((error) => {
    //         this.$swal({
    //           title: "Oops, Something went wrong ! ",
    //           text: error.message,
    //           icon: "warning",
    //         });
    //       });
      },
};