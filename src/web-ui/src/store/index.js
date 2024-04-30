import Vue from 'vue';
import Vuex from 'vuex';
import authenticationModule from './modules/authentication';
import postsModule from './modules/posts';
import { authPageModule } from '@/store/auth-store/index.js';

Vue.use(Vuex);

export default new Vuex.Store({
  modules: {
    authenticationModule,
    postsModule,
    authPageModule,
  },
  state: {
  },
  getters: {
  },
  mutations: {
  },
  actions: {
  }
});


