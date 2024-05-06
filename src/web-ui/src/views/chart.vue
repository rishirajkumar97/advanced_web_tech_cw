<template>
    <v-container id="container2">
      <!-- Dropdowns for user inputs -->
      <select v-model="selectedFunction" @change="fetchData">
        <option v-for="func in functions" :value="func" :key="func">{{ func }}</option>
      </select>
      <select v-model="selectedSymbol" @change="fetchData">
        <option v-for="symbol in symbols" :value="symbol" :key="symbol">{{ symbol }}</option>
      </select>
      <select v-model="selectedInterval" @change="fetchData">
        <option v-for="interval in intervals" :value="interval" :key="interval">{{ interval }}</option>
      </select>
      
      <!-- Trading Vue Graph -->
      <trading-vue :data="chart" :width="width-200" :height="height-100"
          :color-back="colors.colorBack"
          :color-grid="colors.colorGrid"
          :color-text="colors.colorText">
      </trading-vue>
    </v-container>
  </template>
  
  <script>
  import TradingVue from 'trading-vue-js'
  import axios from 'axios'
  
  export default {
      name: 'StockDataViewer',
      components: { TradingVue },
      data() {
          return {
              chart: null, // Initially no data
              width: window.innerWidth,
              height: window.innerHeight,
              selectedFunction: 'TIME_SERIES_INTRADAY',
              selectedSymbol: 'IBM',
              selectedInterval: '5min',
              functions: ['TIME_SERIES_INTRADAY', 'TIME_SERIES_DAILY', 'TIME_SERIES_WEEKLY', 'TIME_SERIES_MONTHLY'],
              symbols: ['IBM', 'AAPL', 'GOOGL', 'MSFT'], // Add other symbols
              intervals: ['1min', '5min', '15min', '30min', '60min'],
              colors: {
                  colorBack: '#fff',
                  colorGrid: '#eee',
                  colorText: '#333',
              }
          }
      },
      methods: {
          fetchData() {
              const params = {
                  function: this.selectedFunction,
                  symbol: this.selectedSymbol,
                  interval: this.selectedInterval
              };
              axios.get('http://localhost:3000/stocks/data', { params })
                  .then(response => {
                      this.chart = response.data; // Update chart data
                  })
                  .catch(error => {
                      console.error('Error:', error);
                      alert('Failed to fetch data');
                  });
          },
          onResize() {
              this.width = window.innerWidth;
              this.height = window.innerHeight;
          }
      },
      mounted() {
          this.fetchData(); // Fetch initial data
          window.addEventListener('resize', this.onResize);
      },
      beforeDestroy() {
          window.removeEventListener('resize', this.onResize);
      }
  }
  </script>
  
  <style scoped>
  #container2 {
    background-color: #fff;
    border-radius: 10px;
    box-shadow: 0 14px 28px rgba(0, 0, 0, 0.25), 0 10px 10px rgba(0, 0, 0, 0.22);
    overflow: hidden;
    max-width: 90%;
    min-height: 600px;
  }
  </style>