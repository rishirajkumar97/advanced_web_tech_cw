import axios from 'axios';

axios.defaults.baseURL = 'https://news-service-dot-white-flame-246305.nw.r.appspot.com';
axios.interceptors.request.use((config) => {
  if (typeof window === 'undefined') {
    return config;
  }
  const token = window.localStorage.getItem('auth_token');
  if (config.url != 'https://white-flame-246305.nw.r.appspot.com/login')
  {
    if (token) {
      const req = config;
      req.headers.Authorization = token;
    }
  }
  return config;
});

const appService = {
  async getPosts(categoryId) {
    try {
      const response = await axios.get(`/market_news_data?topics=${categoryId.topic}`);
      return response.data.feed;
        }
    catch (error) {
      console.error('Failed to fetch posts:', error);
      throw error;  // Throw to handle errors where this function is called
    }
  },
  async getTopGainersLosers() {
    try {
      const response = await axios.get(`/top_gain_loss?symbol=IBM`);
      return response.data;
        }
    catch (error) {
      console.error('Failed to fetch posts:', error);
      throw error;  // Throw to handle errors where this function is called
    }
  },
  async getProfile() {
    try {
      const response = await axios.get('/services/profile.php');
      return response.data;
    } catch (error) {
      throw error;
    }
  },
  async login(credentials) {
    try {
      const response = await axios.post('/services/auth.php', credentials);
      return response.data;
    } catch (error) {
      throw error.status;
    }
  },
};

export default appService;
