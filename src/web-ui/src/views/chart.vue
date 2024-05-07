<template>

  <v-container
    id="container2">

  <b-row class="sticky-top">
      <b-col>
        <h3>Select Stock/Currency</h3>
        <!-- Floating Dropdown for Topics -->
        <b-form-select  v-model="selectedStock"  :options="stockOptions" class="mb-4"  ></b-form-select>
      </b-col>

       <b-col>
        <h3>Select Time Interval</h3>
        <!-- Floating Dropdown for Topics -->
        <b-form-select v-model="selectedInterval"  :options="intervalOptions" class="mb-4"  ></b-form-select>
      </b-col>
        <v-btn
           style="background-color: #4CAF50 ; color: white;"
          text
          block
          tile
          elevation="0"
          @click="updateChart()"
          class="pa-6 font-weight-bold"
        >
          Update Chart
        </v-btn>
    </b-row>

<trading-vue :data="chart" :width="this.width-200" :height="this.height-100"
    :color-back="colors.colorBack"
    :color-grid="colors.colorGrid"
    :color-text="colors.colorText">
</trading-vue>
<h3>{{selectedStock}} @ {{selectedInterval}}</h3>


  </v-container>
</template>

<script>
import TradingVue from 'trading-vue-js';
import Data from '@/assets/data.json'; //DELETE THIS
import axios from 'axios';

export default {
    name: 'app',
    components: { TradingVue },
    methods: {
        onResize(event) {
            this.width = window.innerWidth
            this.height = window.innerHeight
        }
    },


    mounted() {
        window.addEventListener('resize', this.onResize),
        this.convertData(Data) //DELETE THIS
        // this.updateChart(this.selectedStock,this.selectedInterval)
    },


    beforeDestroy() {
        window.removeEventListener('resize', this.onResize)
    },



    data() {
            return {
                selectedStock: 'XOM',
                selectedInterval: '5min',
                chart: Data,
                width: window.innerWidth,
                height: window.innerHeight,
                colors: {
                    colorBack: '#fff',
                    colorGrid: '#eee',
                    colorText: '#333',
                },
                rawData:null,

                            intervalOptions : [
                { value: '1min', text: 'Changes every 1 minute' },
                { value: '5min', text: 'Changes every 5 minutes' },
                { value: '15min', text: 'Changes every 15 minutes' },
                { value: '30min', text: 'Changes every 30 minutes' },
                { value: '60min', text: 'Changes every 60 minutes' }
                ],

                            stockOptions: [
                    
                { value: 'MSFT', text: 'Microsoft Corporation' },
                { value: 'AAPL', text: 'Apple Inc.' },
                { value: 'NVDA', text: 'NVIDIA Corporation' },
                { value: 'GOOG', text: 'Alphabet Inc. (Class C)' },
                { value: 'GOOGL', text: 'Alphabet Inc. (Class A)' },
                { value: 'AMZN', text: 'Amazon.com Inc.' },
                { value: 'META', text: 'Meta Platforms Inc.' },
                { value: 'BRK/A', text: 'Berkshire Hathaway Inc. (Class A)' },
                { value: 'BRK/B', text: 'Berkshire Hathaway Inc. (Class B)' },
                { value: 'TSM', text: 'Taiwan Semiconductor Manufacturing Company Ltd.' },
                { value: 'LLY', text: 'Eli Lilly and Company' },
                { value: 'AVGO', text: 'Broadcom Inc.' },
                { value: 'TSLA', text: 'Tesla Inc.' },
                { value: 'NVO', text: 'Novo Nordisk A/S' },
                { value: 'JPM', text: 'JPMorgan Chase & Co.' },
                { value: 'V', text: 'Visa Inc.' },
                { value: 'WMT', text: 'Walmart Inc.' },
                { value: 'XOM', text: 'Exxon Mobil Corporation' },
                { value: 'UNH', text: 'UnitedHealth Group Incorporated' },
                { value: 'MA', text: 'Mastercard Incorporated' },
                { value: 'PG', text: 'Procter & Gamble Company' },
                { value: 'ASML', text: 'ASML Holding N.V.' },
                { value: 'JNJ', text: 'Johnson & Johnson' },
                { value: 'HD', text: 'The Home Depot Inc.' },
                { value: 'COST', text: 'Costco Wholesale Corporation' }
                ], } },




    methods:{

            // async updateChart(stock,interval) {

            //     try {
            //         // const response = await axios.get(`https://stock-api-service.white-flame-246305.nw.r.appspot.com/stocks/data?symbol=${stock}&interval=${interval}&function=TIME_SERIES_INTRADAY`,
            //         const response = await axios.get('https://stock-api-service.white-flame-246305.nw.r.appspot.com/stocks/data?symbol=IBM&interval=5min&function=TIME_SERIES_INTRADAY') //DELETE THIS
            //         // this.rawData = response.data;
            //         console.log('Response:', this.response); //DELETE THIS
            //         //  this.convertData(response) 
            //     } catch (error) {
            //         console.error('Error:', error);
            //     } },

               
async updateChart() {
  try {
    const response = await axios.get(`https://stock-api-service-dot-white-flame-246305.nw.r.appspot.com/stocks/data?symbol=${this.selectedStock}&interval=${this.selectedInterval}&function=TIME_SERIES_INTRADAY`);
     this.rawData=response.data
     this.convertData(response.data) 
    // Call method to handle response data (e.g., convertData)
  } catch (error) {
    if (error.response) {
      // The request was made and the server responded with a status code that falls out of the range of 2xx
      console.error('Server Error:', error.response.data);
      console.error('Status Code:', error.response.status);
    } else if (error.request) {
      // The request was made but no response was received
      console.error('No Response Received:', error.request);
    } else {
      // Something happened in setting up the request that triggered an Error
      console.error('Error:', error.message);
    }
  }
},



                convertData(initialData) {
                    const timeSeries = initialData[Object.keys(initialData)[1]];
                
                    //    const timeSeries = Data2["Time Series (5min)"];
                    let tempData = [];

                    // Iterate over each timestamp in the time series
                    for (const timestamp in timeSeries) {
                        if (timeSeries.hasOwnProperty(timestamp)) {
                        const entry = timeSeries[timestamp];
                        const timestampMs = Date.parse(timestamp) - 161061000000;
                        const open = parseFloat(entry["1. open"]);
                        const high = parseFloat(entry["2. high"]);
                        const low = parseFloat(entry["3. low"]);
                        const close = parseFloat(entry["4. close"]);
                        const volume = parseFloat(entry["5. volume"]);

                        // Push data in the format [timestamp, open, high, low, close, volume] to the data array
                        tempData.push([timestampMs, open, high, low, close, volume]);
                        }
                    }
                        tempData = tempData.reverse();
                    // Set the chartData with the converted data
                    this.chart = {
                        chart: {
                        type: "Candles",
                        data: tempData
                        }
                    };
             
                    
                    }
    }
}
</script>





<style>
.container22 {
  background-color: #fff;
  border-radius: 10px;
  box-shadow: 0 14px 28px rgba(0, 0, 0, 0.25), 0 10px 10px rgba(0, 0, 0, 0.22);
  position: overlay;
  overflow: hidden;
  max-width: 90%;
  min-height: 600px;
}
</style>