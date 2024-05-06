import axios from 'axios'
import router from '../../router/index'

export const actions = {
    loginAndSaveToken(context, { username, password }) {
        // this is just an example on how to save the JWT Token, PS AUTH API is fake
        axios.post('https://meta-geography-243114.nw.r.appspot.com/login', { user:  { email: username, password: password } } ).then((response) => {
            let token = response.data.status.data.token;
            localStorage.setItem('auth_token', token);
            this.state.loggedin=true
            
            router.push('/category/front-end');
            window.location.reload();
            console.log("asdfasdfasdfsdfasdf", this.state.loggedin)
        }).catch((error) => {
            console.log(error);
            print("couldnot logged in")
            //will always redirect to profile np
            router.push('/404');
        });
       
    },

    logout(context) {
<<<<<<< HEAD
        localStorage.removeItem('auth_token');
       
       
        axios.delete('https://meta-geography-243114.nw.r.appspot.com/logout' ).then((response) => {
            //
         
              if (localStorage.getItem(auth_token)) {
                const req = config;
                req.headers.Authorization = token;
              }
          
              localStorage.removeItem('auth_token'); 
              router.push('/auth');   
              window.location.reload();
              
           
        }).catch((error) => {
            console.log(error);
            //will always redirect to profile np
            router.push('/404');
        });
    }




=======
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
    }
>>>>>>> 6e95c990e013a08e00d8ca0d901dec15953df509
};