import axios from 'axios';

axios.defaults.baseURL = 'https://api.fullstackweekly.com';
axios.interceptors.request.use((config) => {
  if (typeof window === 'undefined') {
    return config;
  }
  const token = window.localStorage.getItem('token');
  if (token) {
    const req = config;
    req.headers.Authorization = `Bearer ${token}`;
  }
  return config;
});

const appService = {
  async getPosts(categoryId) {
    try {
      const response = await axios.get(`/wp-json/wp/v2/posts?categories=${categoryId}&per_page=12`);
      let data = {
        "items": "1000",
        "sentiment_score_definition": "x <= -0.35: Bearish; -0.35 < x <= -0.15: Somewhat-Bearish; -0.15 < x < 0.15: Neutral; 0.15 <= x < 0.35: Somewhat_Bullish; x >= 0.35: Bullish",
        "relevance_score_definition": "0 < x <= 1, with a higher score indicating higher relevance.",
        "feed": [
          {
            "title": "Three Sixty Solar Announces Private Placement Closing of First Tranche - Three Sixty Solar  ( OTC:VSOLF ) ",
            "url": "https://www.benzinga.com/pressreleases/24/04/g38530344/three-sixty-solar-announces-private-placement-closing-of-first-tranche",
            "time_published": "20240430T175418",
            "authors": [
              "Globe Newswire"
            ],
            "summary": "THIS NEWS RELEASE IS NOT FOR DISTRIBUTION TO U.S. NEWSWIRE SERVICES FOR DISSEMINATION IN THE UNITED STATES",
            "banner_image": "https://www.benzinga.com/next-assets/images/schema-image-default.png",
            "source": "Benzinga",
            "category_within_source": "News",
            "source_domain": "www.benzinga.com",
            "topics": [
              {
                "topic": "Technology",
                "relevance_score": "1.0"
              },
              {
                "topic": "Financial Markets",
                "relevance_score": "0.650727"
              }
            ],
            "overall_sentiment_score": 0.211425,
            "overall_sentiment_label": "Somewhat-Bullish",
            "ticker_sentiment": [
              {
                "ticker": "META",
                "relevance_score": "0.05133",
                "ticker_sentiment_score": "0.129794",
                "ticker_sentiment_label": "Neutral"
              },
              {
                "ticker": "VSOLF",
                "relevance_score": "0.3007",
                "ticker_sentiment_score": "0.224217",
                "ticker_sentiment_label": "Somewhat-Bullish"
              }
            ]
          } ]}
      return data.feed;
    } catch (error) {
      throw error;
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
