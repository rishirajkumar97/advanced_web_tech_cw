<template>
  <div>
    <h2>Top Gainers</h2>
    <table>
      <thead>
        <tr>
          <th>Ticker</th>
          <th>Price</th>
          <th>Change Amount</th>
          <th>Change Percentage</th>
          <th>Volume</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="gainer in data.top_gainers" :key="gainer.ticker">
          <td>{{ gainer.ticker }}</td>
          <td>{{ gainer.price }}</td>
          <td>{{ gainer.change_amount }}</td>
          <td>{{ gainer.change_percentage }}</td>
          <td>{{ gainer.volume }}</td>
        </tr>
      </tbody>
    </table>

    <h2>Top Losers</h2>
    <table>
      <thead>
        <tr>
          <th>Ticker</th>
          <th>Price</th>
          <th>Change Amount</th>
          <th>Change Percentage</th>
          <th>Volume</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="loser in data.top_losers" :key="loser.ticker">
          <td>{{ loser.ticker }}</td>
          <td>{{ loser.price }}</td>
          <td>{{ loser.change_amount }}</td>
          <td>{{ loser.change_percentage }}</td>
          <td>{{ loser.volume }}</td>
        </tr>
      </tbody>
    </table>
  </div>
</template>

<script>

import { ref, onMounted } from 'vue';
import appService from './../app.service.js';

export default {
  name: 'TopStocks',
  setup() {
    const data = ref({
      top_gainers: [],
      top_losers: []
    });

    // Fetch data on component mount
    onMounted(async () => {
      try {
        const result = await appService.getTopGainersLosers();
        data.value.top_gainers = result.top_gainers;
        data.value.top_losers = result.top_losers;
      } catch (error) {
        console.error('Failed to fetch data:', error);
      }
    });

    return { data };
  }
};
</script>

<style>
table {
  width: 100%;
  border-collapse: collapse;
}
th, td {
  border: 1px solid #ccc;
  padding: 8px;
  text-align: left;
}
thead {
  background-color: #f4f4f4;
}
</style>
