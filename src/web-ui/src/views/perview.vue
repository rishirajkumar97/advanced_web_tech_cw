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
        <tr v-for="(gainer, index) in data.top_gainers" :key="gainer.ticker" :class="`gainer-row gainer-row-${index}`">
          <td>{{ gainer.ticker }}</td>
          <td>{{ gainer.price }}</td>
          <td>{{ gainer.change_amount }}</td>
          <td>{{ gainer.change_percentage }}</td>
          <td>{{ formatVolume(gainer.volume) }}</td>
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
        <tr v-for="(loser, index) in data.top_losers" :key="loser.ticker" :class="`loser-row loser-row-${index}`">
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

import { ref, onMounted, computed } from 'vue';
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

    // Function to pad the volume numbers
    const formatVolume = (volume) => {
      return volume.toString().padStart("10".value, '0');
    };

    return { data, formatVolume };
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
/* Styles for Gainers with fading green */
.gainer-row-0  { background-color: #4CAF50; } /* Darkest green */
.gainer-row-1  { background-color: #5CB85C; }
.gainer-row-2  { background-color: #6EC067; }
.gainer-row-3  { background-color: #80C872; }
.gainer-row-4  { background-color: #91D07D; }
.gainer-row-5  { background-color: #A3D888; }
.gainer-row-6  { background-color: #B4E092; }
.gainer-row-7  { background-color: #C6E89D; }
.gainer-row-8  { background-color: #D7F0A7; }
.gainer-row-9  { background-color: #E9F7B2; }
.gainer-row-10 { background-color: #F0FAC2; }
.gainer-row-11 { background-color: #F4FCCB; }
.gainer-row-12 { background-color: #F8FED5; }
.gainer-row-13 { background-color: #FBFFDE; }
.gainer-row-14 { background-color: #FDFFE7; }
.gainer-row-15 { background-color: #FEFFF0; }
.gainer-row-16 { background-color: #FFFFF8; }
.gainer-row-17 { background-color: #FFFFFB; }
.gainer-row-18 { background-color: #FFFFFD; }
.gainer-row-19 { background-color: #FFFFFF; } /* Lightest green */

/* Styles for Losers with fading red */
.loser-row-0  { background-color: #FF6347; } /* Darkest red */
.loser-row-1  { background-color: #FF7160; }
.loser-row-2  { background-color: #FF7F79; }
.loser-row-3  { background-color: #FF8D92; }
.loser-row-4  { background-color: #FF9BAB; }
.loser-row-5  { background-color: #FFA9C4; }
.loser-row-6  { background-color: #FFB7DD; }
.loser-row-7  { background-color: #FFC5F6; }
.loser-row-8  { background-color: #FFD3FF; }
.loser-row-9  { background-color: #FFE1FF; }
.loser-row-10 { background-color: #FFEEFF; }
.loser-row-11 { background-color: #FFF2FF; }
.loser-row-12 { background-color: #FFF6FF; }
.loser-row-13 { background-color: #FFFAFF; }
.loser-row-14 { background-color: #FFFDFF; }
.loser-row-15 { background-color: #FFFFFE; }
.loser-row-16 { background-color: #FFFFFF; }
.loser-row-17 { background-color: #FFFFFF; }
.loser-row-18 { background-color: #FFFFFF; }
.loser-row-19 { background-color: #FFFFFF; }
</style>