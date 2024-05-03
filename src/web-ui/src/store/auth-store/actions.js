import axios from 'axios'
import router from '../../router/index'

export const actions = {
    loginAndSaveToken(context, { username, password }) {
        // this is just an example on how to save the JWT Token, PS AUTH API is fake
        axios.post('https://meta-geography-243114.nw.r.appspot.com/login', { user:  { email: username, password: password } } ).then((response) => {
            let token = response.data.status.data.token;
            localStorage.setItem('auth_token', token);
            router.push('/category/front-end');
        }).catch((error) => {
            console.log(error);
            //will always redirect to profile np
            router.push('/404');
        });
    },
};