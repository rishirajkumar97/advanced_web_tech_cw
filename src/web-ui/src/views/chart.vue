<template>

  <v-container
    id="container2">
<trading-vue :data="chart" :width="this.width-200" :height="this.height-100"
    :color-back="colors.colorBack"
    :color-grid="colors.colorGrid"
    :color-text="colors.colorText">
</trading-vue>

  </v-container>
</template>

<script>
import TradingVue from 'trading-vue-js'
import Data from '@/assets/data.json'

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
        window.addEventListener('resize', this.onResize)
    },
    beforeDestroy() {
        window.removeEventListener('resize', this.onResize)
    },
    data() {
        return {
            chart: Data,
            width: window.innerWidth,
            height: window.innerHeight,
            colors: {
                colorBack: '#fff',
                colorGrid: '#eee',
                colorText: '#333',
            }
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