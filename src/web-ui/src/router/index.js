import Vue from 'vue';
import Router from 'vue-router';
import Category from '@/views/Category.vue';
import NotFound from '@/views/NotFound.vue';
import perview from '@/views/perview.vue';
;
import chart from '@/views/chart.vue';

import authPage from '@/views/signup/auth-page.vue';
/* import profile from '@/views/signup/profile.vue'; */

Vue.use(Router);

export default new Router({
  mode: 'history',
  base: process.env.BASE_URL,
  linkActiveClass: 'active',
  scrollBehavior(to, from, savedPosition) {
    if (savedPosition) {
      return savedPosition;
    }
    return { y: 0 };
  },
  routes: [
    {
      path: '/',
      redirect: '/category/front-end',
    },
    {
      path: '/category/:id',
      name: 'category',
      component: Category,
    },
    
    {
      path: '/chart',
      name: 'chart',
      component: chart,
    },

   {
    path: '/auth',
    name: 'authPage',
    component: authPage
   },
   {
    path: '/perview',
    name: 'perview',
    component: perview,
   },
    {
      path: '*',
      component: NotFound,
    }



  ],
});
