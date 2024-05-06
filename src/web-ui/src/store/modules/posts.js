import appService from './../../app.service';

const state = {
  posts: [],
  categoryId: 0,
  topic: null,
  loading: false,
};

const mutations = {
  updateCategory: (state, category) => {
    state.categoryId = category.categoryId;
    state.posts = category.posts;
  },
  setLoading: (state, loading) => {  // Mutation to set the loading state
    state.loading = loading;
  },
};

const actions = {
  updateCategory: (context, categoryId) => {
    context.commit('setLoading', true);
    appService.getPosts(categoryId).then((data) => {
      context.commit('updateCategory', { categoryId, posts: data });
      context.commit('setLoading', false);
    }).catch((error) => {
      context.commit('setLoading', false);    // Set error state
    });;
  },
};

const getters = {
  posts: state => state.posts,
 isLoading: state => state.loading,
};

export default {
  namespaced: true,
  state,
  mutations,
  actions,
  getters,
};
