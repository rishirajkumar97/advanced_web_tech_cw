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
import { ref } from 'vue';

export default {
  name: 'TopStocks',
  setup() {
    const data = ref({
      top_gainers: [
       { ticker: "CTMX", price: "5.13", change_amount: "3.5", change_percentage: "214.7239%", volume: "203337618" },
      { ticker: "NCNCW", price: "0.0183", change_amount: "0.0107", change_percentage: "140.7895%", volume: "10" },
      { ticker: "SYT", price: "3.27", change_amount: "1.8", change_percentage: "122.449%", volume: "12107898" },
      { ticker: "DISTW", price: "0.0498", change_amount: "0.0243", change_percentage: "95.2941%", volume: "1945" },
      { ticker: "CSSEP", price: "2.45", change_amount: "1.18", change_percentage: "92.9134%", volume: "1195347" },
      { ticker: "RGF", price: "0.49", change_amount: "0.207", change_percentage: "73.1449%", volume: "4486432" },
      { ticker: "NUVB+", price: "0.299", change_amount: "0.1165", change_percentage: "63.8356%", volume: "310" },
      { ticker: "JTAIW", price: "0.0451", change_amount: "0.015", change_percentage: "49.8339%", volume: "368" },
      { ticker: "LEXXW", price: "1.47", change_amount: "0.4884", change_percentage: "49.7555%", volume: "3141" },
      { ticker: "GMFIW", price: "0.0599", change_amount: "0.0199", change_percentage: "49.75%", volume: "6100" },
      { ticker: "BCAB", price: "3.37", change_amount: "1.115", change_percentage: "49.4457%", volume: "4072736" },
      { ticker: "SXTPW", price: "0.1043", change_amount: "0.0343", change_percentage: "49.0%", volume: "35519" },
      { ticker: "WKSPW", price: "0.0469", change_amount: "0.0154", change_percentage: "48.8889%", volume: "1600" },
      { ticker: "HGASW", price: "0.0548", change_amount: "0.0171", change_percentage: "45.3581%", volume: "1200" },
      { ticker: "KITTW", price: "0.0287", change_amount: "0.0089", change_percentage: "44.9495%", volume: "17505" },
      { ticker: "MNYWW", price: "0.12", change_amount: "0.035", change_percentage: "41.1765%", volume: "900" },
      { ticker: "IGTAW", price: "0.14", change_amount: "0.04", change_percentage: "40.0%", volume: "15667" },
      { ticker: "PLTNR", price: "0.367", change_amount: "0.097", change_percentage: "35.9259%", volume: "1108950" },
      { ticker: "APVO", price: "0.96", change_amount: "0.2493", change_percentage: "35.0781%", volume: "5744074" },
      { ticker: "AKA", price: "19.43", change_amount: "4.92", change_percentage: "33.9076%", volume: "21150" }
      ],
      top_losers: [
        { ticker: "CETX", price: "0.3055", change_amount: "-0.8345", change_percentage: "-73.2018%", volume: "18397534" },
        { ticker: "SAVAW", price: "0.1256", change_amount: "-0.1445", change_percentage: "-53.4987%", volume: "1676016" },
        { ticker: "ARKOW", price: "0.0976", change_amount: "-0.0848", change_percentage: "-46.4912%", volume: "38733" },
        { ticker: "CDTTW", price: "0.0506", change_amount: "-0.0394", change_percentage: "-43.7778%", volume: "4854" },
        { ticker: "BNIXW", price: "0.02", change_amount: "-0.0148", change_percentage: "-42.5287%", volume: "49" },
        { ticker: "SVMHW", price: "0.0084", change_amount: "-0.0058", change_percentage: "-40.8451%", volume: "302438" },
        { ticker: "NXLIW", price: "0.087", change_amount: "-0.0564", change_percentage: "-39.3305%", volume: "506" },
        { ticker: "BENF", price: "2.04", change_amount: "-1.28", change_percentage: "-38.5542%", volume: "268308" },
        { ticker: "APCXW", price: "0.23", change_amount: "-0.14", change_percentage: "-37.8378%", volume: "5021" },
        { ticker: "NRXPW", price: "0.0889", change_amount: "-0.0511", change_percentage: "-36.5%", volume: "23826" },
        { ticker: "SES+", price: "0.043", change_amount: "-0.0245", change_percentage: "-36.2963%", volume: "5071" },
        { ticker: "ECDAW", price: "0.0255", change_amount: "-0.0145", change_percentage: "-36.25%", volume: "515" },
        { ticker: "CVRX", price: "10.12", change_amount: "-5.39", change_percentage: "-34.7518%", volume: "1582312" },
        { ticker: "TNONW", price: "0.0355", change_amount: "-0.0184", change_percentage: "-34.1373%", volume: "2719" },
        { ticker: "HSPOW", price: "0.02", change_amount: "-0.01", change_percentage: "-33.3333%", volume: "91400" },
        { ticker: "FMSTW", price: "0.43", change_amount: "-0.2018", change_percentage: "-31.9405%", volume: "3" },
        { ticker: "MNTSW", price: "0.009", change_amount: "-0.004", change_percentage: "-30.7692%", volume: "13100" },
        { ticker: "SHOTW", price: "0.3121", change_amount: "-0.1376", change_percentage: "-30.5982%", volume: "5" },
        { ticker: "SBXC+", price: "0.119", change_amount: "-0.051", change_percentage: "-30.0%", volume: "866" },
        { ticker: "CLOER", price: "0.12", change_amount: "-0.0512", change_percentage: "-29.9065%", volume: "6" }
      ]
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
