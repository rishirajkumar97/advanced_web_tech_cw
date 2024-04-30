<template>
  <b-card :title="post.title"
  :img-src="post.banner_image"
  >
    <span class="card-text" v-html="this.$options.filters.dataSubstr(post.summary)"></span>
    <em slot="footer" ><a  class="card-link" :href="post.url" target="_blank">Read More</a></em>
  </b-card>
</template>

<script>
import Filters from './../filters/filters';

export default {
  props: ['post'],
  filters: {
    dataSubstr: Filters.dataSubstr,
  },
};
</script>

<style>

</style>
