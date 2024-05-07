import appService from './../../app.service';


const state = {
  posts: [],
  categoryId: 0,
  topic: null,
  loading: false,
  error: null,
};

const mutations = {
  updateCategory: (state, category) => {
    state.categoryId = category.categoryId;
    state.posts = category.posts;
  },
  setLoading: (state, loading) => {  // Mutation to set the loading state
    state.loading = loading;
  },
  setError: (state, error) => {  // Mutation to set the loading state
    state.error = error;
  },
};

const actions = {
  updateCategory: (context, categoryId) => {
    context.commit('setLoading', true);
    appService.getPosts(categoryId).then((data) => {
      context.commit('updateCategory', { categoryId, posts: data });
      context.commit('setLoading', false);
      context.commit('setError', null); 
    }).catch((error) => {
      context.commit('setLoading', false);
      context.commit('setError', error);    // Set error state
    });;
  },


//   updateChart (context, {selectedStock, selectedInterval}) {
//     console.log("selectedStock,selectedInterval",selectedStock,selectedInterval)
//   //   axios.get(`https://stock-api-service.white-flame-246305.nw.r.appspot.com/stocks/data?symbol=${selectedStock}&interval=${selectedInterval}&function=TIME_SERIES_INTRADAY`,
//   axios.get('https://stock-api-service.white-flame-246305.nw.r.appspot.com/stocks/data?symbol=IBM&interval=5min&function=TIME_SERIES_INTRADAY',
//     ).then((response) => {
//     // let token = response.data.status.data.token;
// console.log(response)
//  return
 

// }).catch((error) => {
//     console.log(error);
//     //will always redirect to profile np
//     window.alert(" Couldn't update Chart, Internal Error");
// }); 
//   // 


//   }

};

const getters = {
  posts: state => state.posts,
 isLoading: state => state.loading,
 error: state => state.error,
};

export default {
  namespaced: true,
  state,
  mutations,
  actions,
  getters,
};
