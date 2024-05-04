# app/services/alpha_vantage_service.rb

require 'faraday'
require 'json'

# Service to Invoke External Alpha Vantage API
class AlphaVantageService
  LIMIT = 1000
  ALPHA_VANTAGE_API = 'https://www.alphavantage.co'
  def initialize
    @api_key = ENV['ALPHA_VANTAGE_API_KEY']
    @connection = Faraday.new(url: ALPHA_VANTAGE_API)
  end

  def get_news_sentiment(topics, limit = LIMIT)
    query_params = {
      function: 'NEWS_SENTIMENT',
      limit:,
      apikey: @api_key
    }
    query_params[:topics] = topics if topics.present?
    response = @connection.get('/query', query_params)
    data = handle_response(response)
    # Do Hardcode as only 25 Alpha Vantage API calls per day
    if data[:error].present?
      data = {
        "items": '50',
        "sentiment_score_definition": 'x <= -0.35: Bearish; -0.35 < x <= -0.15: Somewhat-Bearish; -0.15 < x < 0.15: Neutral; 0.15 <= x < 0.35: Somewhat_Bullish; x >= 0.35: Bullish',
        "relevance_score_definition": '0 < x <= 1, with a higher score indicating higher relevance.',
        "feed": [
          {
            "title": "Warren Buffett Confidence In Apple Wanes? Berkshire Cuts Stake By 18% Amid Tech Giant's Troubles - Apple  ( NASDAQ:AAPL ) , American Express  ( NYSE:AXP ) ",
            "url": 'https://www.benzinga.com/markets/equities/24/05/38630421/warren-buffett-confidence-in-apple-wanes-berkshire-cuts-stake-by-18-amid-tech-giants-troubles',
            "time_published": '20240504T160317',
            "authors": [
              'Shanthi Rexaline'
            ],
            "summary": "Warren Buffett's Berkshire, Inc. BRK BRK trimmed its position in its key core holding, Apple, Inc. AAPL, a 10-Q report for the first quarter filed with the SEC on Saturday showed. Paring Equity Bets: Berkshire's equity securities investment dropped from $353.84 billion in Q1 2023 to $335.86 ...",
            "banner_image": 'https://cdn.benzinga.com/files/images/story/2024/05/04/Apple-Shutterstock.jpeg?width=1200&height=800&fit=crop',
            "source": 'Benzinga',
            "category_within_source": 'Trading',
            "source_domain": 'www.benzinga.com',
            "topics": [
              {
                "topic": 'Financial Markets',
                "relevance_score": '0.266143'
              },
              {
                "topic": 'Manufacturing',
                "relevance_score": '0.25'
              },
              {
                "topic": 'Earnings',
                "relevance_score": '0.360215'
              },
              {
                "topic": 'Energy & Transportation',
                "relevance_score": '0.25'
              },
              {
                "topic": 'Technology',
                "relevance_score": '0.25'
              },
              {
                "topic": 'Finance',
                "relevance_score": '0.25'
              }
            ],
            "overall_sentiment_score": 0.055317,
            "overall_sentiment_label": 'Neutral',
            "ticker_sentiment": [
              {
                "ticker": 'AXP',
                "relevance_score": '0.194242',
                "ticker_sentiment_score": '-0.142127',
                "ticker_sentiment_label": 'Neutral'
              },
              {
                "ticker": 'AAPL',
                "relevance_score": '0.859898',
                "ticker_sentiment_score": '-0.02087',
                "ticker_sentiment_label": 'Neutral'
              },
              {
                "ticker": 'BAC',
                "relevance_score": '0.194242',
                "ticker_sentiment_score": '-0.142127',
                "ticker_sentiment_label": 'Neutral'
              },
              {
                "ticker": 'CVX',
                "relevance_score": '0.194242',
                "ticker_sentiment_score": '-0.142127',
                "ticker_sentiment_label": 'Neutral'
              },
              {
                "ticker": 'KO',
                "relevance_score": '0.194242',
                "ticker_sentiment_score": '-0.142127',
                "ticker_sentiment_label": 'Neutral'
              }
            ]
          },
          {
            "title": 'Berkshire Hathaway Trims Its Apple Investment and Has $189 Billion in Cash',
            "url": 'https://www.fool.com/investing/2024/05/04/berkshire-hathaway-trims-its-apple-investment-and/',
            "time_published": '20240504T151558',
            "authors": [
              'Matt Frankel'
            ],
            "summary": "The conglomerate just reported its first-quarter results, so here's a rundown of the key figures.",
            "banner_image": 'https://g.foolcdn.com/editorial/images/775861/buffett8-tmf.jpg',
            "source": 'Motley Fool',
            "category_within_source": 'n/a',
            "source_domain": 'www.fool.com',
            "topics": [
              {
                "topic": 'Economy - Monetary',
                "relevance_score": '0.158519'
              },
              {
                "topic": 'Financial Markets',
                "relevance_score": '0.996023'
              },
              {
                "topic": 'Earnings',
                "relevance_score": '0.999759'
              },
              {
                "topic": 'Technology',
                "relevance_score": '0.5'
              },
              {
                "topic": 'Finance',
                "relevance_score": '0.5'
              }
            ],
            "overall_sentiment_score": 0.220681,
            "overall_sentiment_label": 'Somewhat-Bullish',
            "ticker_sentiment": [
              {
                "ticker": 'AAPL',
                "relevance_score": '0.162802',
                "ticker_sentiment_score": '0.212585',
                "ticker_sentiment_label": 'Somewhat-Bullish'
              },
              {
                "ticker": 'BRK-A',
                "relevance_score": '0.108958',
                "ticker_sentiment_score": '0.113996',
                "ticker_sentiment_label": 'Neutral'
              }
            ]
          }
        ]
      }
    end
    data
  end

  def get_top_gainers_losers
    response = @connection.get('/query', {
                                 function: 'TOP_GAINERS_LOSERS',
                                 apikey: @api_key
                               })

    data = handle_response(response)

    # DO Hardcode is the API limit Exceeds
    if data[:error].present?
      data = {
        "metadata": 'Top gainers, losers, and most actively traded US tickers',
        "last_updated": '2024-05-03 16:15:59 US/Eastern',
        "top_gainers": [
          {
            "ticker": 'BENF',
            "price": '6.82',
            "change_amount": '4.9',
            "change_percentage": '255.2083%',
            "volume": '30750193'
          },
          {
            "ticker": 'BENFW',
            "price": '0.0182',
            "change_amount": '0.01',
            "change_percentage": '121.9512%',
            "volume": '13208943'
          },
          {
            "ticker": 'SGBX',
            "price": '5.54',
            "change_amount": '2.61',
            "change_percentage": '89.0785%',
            "volume": '91792178'
          },
          {
            "ticker": 'EVGRW',
            "price": '0.07',
            "change_amount": '0.0322',
            "change_percentage": '85.1852%',
            "volume": '5840'
          },
          {
            "ticker": 'BWAQW',
            "price": '0.15',
            "change_amount": '0.0647',
            "change_percentage": '75.8499%',
            "volume": '1199'
          },
          {
            "ticker": 'STSSW',
            "price": '0.085',
            "change_amount": '0.0349',
            "change_percentage": '69.6607%',
            "volume": '9190'
          },
          {
            "ticker": 'FBYDW',
            "price": '1.18',
            "change_amount": '0.4723',
            "change_percentage": '66.7373%',
            "volume": '401'
          },
          {
            "ticker": 'TDW+',
            "price": '18.2',
            "change_amount": '7.1',
            "change_percentage": '63.964%',
            "volume": '14699'
          },
          {
            "ticker": 'WINVR',
            "price": '0.0808',
            "change_amount": '0.0308',
            "change_percentage": '61.6%',
            "volume": '16'
          },
          {
            "ticker": 'BNAIW',
            "price": '0.08',
            "change_amount": '0.0299',
            "change_percentage": '59.6806%',
            "volume": '200'
          },
          {
            "ticker": 'PLAOW',
            "price": '0.0796',
            "change_amount": '0.0294',
            "change_percentage": '58.5657%',
            "volume": '2251'
          },
          {
            "ticker": 'MI',
            "price": '6.16',
            "change_amount": '2.1799',
            "change_percentage": '54.77%',
            "volume": '2140294'
          },
          {
            "ticker": 'APCXW',
            "price": '0.3487',
            "change_amount": '0.1187',
            "change_percentage": '51.6087%',
            "volume": '15646'
          },
          {
            "ticker": 'GIPRW',
            "price": '0.3999',
            "change_amount": '0.1347',
            "change_percentage": '50.7919%',
            "volume": '210'
          },
          {
            "ticker": 'KPLTW',
            "price": '0.0186',
            "change_amount": '0.0062',
            "change_percentage": '50.0%',
            "volume": '7640'
          },
          {
            "ticker": 'AWINW',
            "price": '0.0247',
            "change_amount": '0.008',
            "change_percentage": '47.9042%',
            "volume": '1138638'
          },
          {
            "ticker": 'IBACR',
            "price": '0.1099',
            "change_amount": '0.0349',
            "change_percentage": '46.5333%',
            "volume": '240616'
          },
          {
            "ticker": 'NEOVW',
            "price": '0.36',
            "change_amount": '0.11',
            "change_percentage": '44.0%',
            "volume": '8509'
          },
          {
            "ticker": 'SST+',
            "price": '0.1425',
            "change_amount": '0.0435',
            "change_percentage": '43.9394%',
            "volume": '7210'
          },
          {
            "ticker": 'MYPSW',
            "price": '0.0758',
            "change_amount": '0.0228',
            "change_percentage": '43.0189%',
            "volume": '226'
          }
        ],
        "top_losers": [
          {
            "ticker": 'MNDR',
            "price": '3.39',
            "change_amount": '-18.68',
            "change_percentage": '-84.6398%',
            "volume": '18184438'
          },
          {
            "ticker": 'NUVO',
            "price": '2.04',
            "change_amount": '-2.67',
            "change_percentage": '-56.6879%',
            "volume": '1014141'
          },
          {
            "ticker": 'VRMEW',
            "price": '0.0401',
            "change_amount": '-0.0399',
            "change_percentage": '-49.875%',
            "volume": '30'
          },
          {
            "ticker": 'AEON',
            "price": '1.74',
            "change_amount": '-1.62',
            "change_percentage": '-48.2143%',
            "volume": '909376'
          },
          {
            "ticker": 'PAVMZ',
            "price": '0.021',
            "change_amount": '-0.019',
            "change_percentage": '-47.5%',
            "volume": '550'
          },
          {
            "ticker": 'NXLIW',
            "price": '0.0752',
            "change_amount": '-0.0626',
            "change_percentage": '-45.4282%',
            "volume": '75'
          },
          {
            "ticker": 'QETAR',
            "price": '1.39',
            "change_amount": '-1.1',
            "change_percentage": '-44.1767%',
            "volume": '101'
          },
          {
            "ticker": 'RMCOW',
            "price": '0.0172',
            "change_amount": '-0.0128',
            "change_percentage": '-42.6667%',
            "volume": '27283'
          },
          {
            "ticker": 'LLAP+',
            "price": '0.1',
            "change_amount": '-0.07',
            "change_percentage": '-41.1765%',
            "volume": '23455'
          },
          {
            "ticker": 'SPT',
            "price": '28.82',
            "change_amount": '-19.33',
            "change_percentage": '-40.1454%',
            "volume": '13450195'
          },
          {
            "ticker": 'HUBCZ',
            "price": '0.06',
            "change_amount": '-0.04',
            "change_percentage": '-40.0%',
            "volume": '100'
          },
          {
            "ticker": 'FIACW',
            "price": '0.041',
            "change_amount": '-0.027',
            "change_percentage": '-39.7059%',
            "volume": '10228'
          },
          {
            "ticker": 'TNONW',
            "price": '0.04',
            "change_amount": '-0.0246',
            "change_percentage": '-38.0805%',
            "volume": '6250'
          },
          {
            "ticker": 'YSBPW',
            "price": '0.0501',
            "change_amount": '-0.03',
            "change_percentage": '-37.4532%',
            "volume": '500'
          },
          {
            "ticker": 'RVSNW',
            "price": '0.0703',
            "change_amount": '-0.0379',
            "change_percentage": '-35.0277%',
            "volume": '14167'
          },
          {
            "ticker": 'EDBLW',
            "price": '0.0171',
            "change_amount": '-0.0089',
            "change_percentage": '-34.2308%',
            "volume": '7300'
          },
          {
            "ticker": 'OUST+A',
            "price": '0.0331',
            "change_amount": '-0.0169',
            "change_percentage": '-33.8%',
            "volume": '6336'
          },
          {
            "ticker": 'PROCW',
            "price": '0.0401',
            "change_amount": '-0.0199',
            "change_percentage": '-33.1667%',
            "volume": '118'
          },
          {
            "ticker": 'NUVOW',
            "price": '0.05',
            "change_amount": '-0.0225',
            "change_percentage": '-31.0345%',
            "volume": '2821'
          },
          {
            "ticker": 'PTWOW',
            "price": '0.0623',
            "change_amount": '-0.0272',
            "change_percentage": '-30.3911%',
            "volume": '609'
          }
        ],
        "most_actively_traded": [
          {
            "ticker": 'AAPL',
            "price": '183.36',
            "change_amount": '10.33',
            "change_percentage": '5.9701%',
            "volume": '157762751'
          },
          {
            "ticker": 'SQQQ',
            "price": '11.08',
            "change_amount": '-0.7',
            "change_percentage": '-5.9423%',
            "volume": '152896111'
          },
          {
            "ticker": 'JAGX',
            "price": '0.318',
            "change_amount": '0.0248',
            "change_percentage": '8.4584%',
            "volume": '140307743'
          },
          {
            "ticker": 'NKLA',
            "price": '0.6575',
            "change_amount": '0.045',
            "change_percentage": '7.3469%',
            "volume": '106122363'
          },
          {
            "ticker": 'SGBX',
            "price": '5.54',
            "change_amount": '2.61',
            "change_percentage": '89.0785%',
            "volume": '91792178'
          },
          {
            "ticker": 'FFIE',
            "price": '0.0409',
            "change_amount": '0.0008',
            "change_percentage": '1.995%',
            "volume": '80960116'
          },
          {
            "ticker": 'TSLA',
            "price": '181.14',
            "change_amount": '1.13',
            "change_percentage": '0.6277%',
            "volume": '75192180'
          },
          {
            "ticker": 'TQQQ',
            "price": '56.71',
            "change_amount": '3.2',
            "change_percentage": '5.9802%',
            "volume": '74770627'
          },
          {
            "ticker": 'SPY',
            "price": '511.31',
            "change_amount": '6.28',
            "change_percentage": '1.2435%',
            "volume": '72153442'
          },
          {
            "ticker": 'PARA',
            "price": '12.885',
            "change_amount": '-0.975',
            "change_percentage": '-7.0346%',
            "volume": '66271695'
          },
          {
            "ticker": 'SOXL',
            "price": '38.965',
            "change_amount": '2.515',
            "change_percentage": '6.8999%',
            "volume": '57952389'
          },
          {
            "ticker": 'VAXX',
            "price": '0.1411',
            "change_amount": '0.0369',
            "change_percentage": '35.4127%',
            "volume": '56207819'
          },
          {
            "ticker": 'SOFI',
            "price": '6.96',
            "change_amount": '-0.03',
            "change_percentage": '-0.4292%',
            "volume": '55765902'
          },
          {
            "ticker": 'FXI',
            "price": '27.345',
            "change_amount": '0.195',
            "change_percentage": '0.7182%',
            "volume": '55267581'
          },
          {
            "ticker": 'PLTR',
            "price": '23.325',
            "change_amount": '0.775',
            "change_percentage": '3.4368%',
            "volume": '54880937'
          },
          {
            "ticker": 'DNA',
            "price": '0.9562',
            "change_amount": '0.0951',
            "change_percentage": '11.044%',
            "volume": '54440492'
          },
          {
            "ticker": 'NIO',
            "price": '5.57',
            "change_amount": '-0.02',
            "change_percentage": '-0.3578%',
            "volume": '54313905'
          },
          {
            "ticker": 'FCEL',
            "price": '0.9',
            "change_amount": '0.0465',
            "change_percentage": '5.4482%',
            "volume": '51707200'
          },
          {
            "ticker": 'BRSH',
            "price": '0.0703',
            "change_amount": '0.0087',
            "change_percentage": '14.1234%',
            "volume": '50831663'
          },
          {
            "ticker": 'TLT',
            "price": '89.84',
            "change_amount": '0.9',
            "change_percentage": '1.0119%',
            "volume": '49836080'
          }
        ]
      }
    end

    data
  end

  private

  def handle_response(response)
    if response.status == 200 && JSON.parse(response.body)['Error Message'].blank?
      JSON.parse(response.body)
    else
      { error: "Error fetching data from Alpha Vantage API: Status #{response.body}" }
    end
  end
end
